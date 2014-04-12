var cheerio = require('cheerio'),
    fs = require('fs'),
    classList = {
        classes:[]
    };

fs.readFile('./results.aspx', {encoding:'utf8'}, function (err, data) {
  if (err) throw err;
  var $ = cheerio.load(data, {normalizeWhitespace: true}),
      results = $('table#results tr');


  results.nextAll().each(function(){
      var tdList = $(this).find('td');
      if(tdList.eq(0).text() !== ""){

          classList.classes.push({
              classNum: tdList.eq(0).text(),
              title: tdList.eq(1).text(),
              dayTimes: tdList.eq(4).text(),
              instructor: tdList.eq(5).text()
          });
      }
  });
  fs.writeFile('./app/classes.json', JSON.stringify(classList));
  console.log(classList.classes);
});
