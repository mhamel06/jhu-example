var express = require('express');
var router = express.Router();
var mongodb = require('mongodb');
var mongoURL = "mongodb://nodeuser:jhu@ds053718.mongolab.com:53718/jhu"
var MongoClient = require('mongodb').MongoClient;
var db;

MongoClient.connect(mongoURL, function(err, database) {
  if(err) throw err;

  db = database;
});

/* GET users listing. */
router.get('/', function(req, res) {
    db.collection('topics').find({}, {}).toArray(function(err, docs) {
      if (err) console.warn(err.message);
      res.json(docs);

    });
});

router.get('/:topicId', function(req, res){

    db.collection('topics').find({"_id":mongodb.ObjectID(req.params.topicId)}, {}).nextObject(function(err, doc) {
      if (err) console.warn(err.message);
      res.json(doc);

    });
})

router.post('/', function(req, res){
    db.collection('topics').insert(req.body, {}, function(err, objects) {
      if (err) console.warn(err.message);
      res.send(200);

    });
})

router.post('/reply', function(req, res){
    req.body.user = 'newUser';

    var date = new Date();
    var timestamp = Math.floor(date.getTime()/1000);
    // Create a new ObjectID with a specific timestamp
    var objectId = new mongodb.ObjectID(timestamp);

    req.body._id = objectId;
    req.body.timestamp = date.getTime();

    db.collection('topics').findAndModify(
        {"_id":mongodb.ObjectID(req.body.topicId)},
        {}, {$push:{replies:req.body}}, {},function(err, object){
            if(err){
                console.warn(err);
                res.send(500, err);
            }
            if(!object.replies) object.replies = [];
            object.replies.push(req.body)
            console.log(object);
            res.json(req.body);
        });
})

module.exports = router;
