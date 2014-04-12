<html>
<head><title>
	Johns Hopkins University - Class Search
</title><link href="CSS/styles.css" type="text/css" rel="stylesheet" />
    <script language="javascript"  type="text/javascript" src="include/prototype.js"></script>
    <script language="javascript"  type="text/javascript" src="include/scriptaculous.js" ></script>
    <script language="javascript"  type="text/javascript" src="include/jss_controls.js" ></script>

    <script language="javascript" type="text/javascript">
        function toggleBox(control){
            var div = control.nextSibling;
            while(div.tagName == null || div.tagName.toUpperCase() != "DIV") div = div.nextSibling;
            if(!div) return;
            var img = control.childNodes[0];
            while(img.tagName == null || img.tagName.toUpperCase() != "IMG") img = img.nextSibling;
            if(div.style.display == "none"){
                div.style.display="block";
                img.src = img.src.replace("right","down");
            }
            else {
                div.style.display="none";
                img.src = img.src.replace("down","right");
            }
        }
        function showClassDetails(control,id){
            var row = control;
            var cnt = 0; //
            while(cnt++ < 100 && row.tagName.toUpperCase() != "TR"){
                row = row.parentNode;
            }
            var column_count = row.getElementsByTagName("TD").length;
            var nextrow = row.nextSibling;
            cnt = 0;
            while(nextrow.tagName == null || nextrow.tagName.toUpperCase() != "TR")
                nextrow = nextrow.nextSibling;

            if(nextrow.style.display == "none"){

                var url = "ClassDetails.aspx";
			    var myup = $(control.parentNode);
			    var mycn = myup.className;
			    myup.className = "icon-ajax-16-right";
			    new Ajax.Request(url, {
				    method: "get",
				    parameters: { "id": id},
				    requestHeaders: {"If-Modified-Since": "Thu, 1 Jan 1970 00:00:00 GMT"},
				    onSuccess: function(transport) {
				        try{
				            nextrow.style.display = "";
				            var divname = "details_" + id;
				            var content = "<div style=\"display:none;border-bottom:solid 1px black;\"  id=\"" + divname + "\">" + transport.responseText + "</div>";
				            if(nextrow.cells.length == 0){
				                var newCell = nextrow.insertCell(0);
                                newCell.colSpan = column_count;
                                newCell.innerHTML = content;
                            }
                            else{
                                nextrow.cells[0].innerHTML = content;
                            }
                            control.innerHTML = control.innerHTML.replace("[+]","[-]");
				            new Effect.SlideDown(
						divname,
							{
								duration:.5
							}

					        );
				            }catch(ex){alert(ex.message);}
				    },
				    onComplete: function(transport) {
					    myup.className = mycn;
				    },
				    onError: function(err){alert(err.message);}
			    });

			}
			else{
			    nextrow.style.display = "none";
			    control.innerHTML = control.innerHTML.replace("[-]","[+]");
			}
		}

		function showTextbookPopup(el, strOfSectionIDs) {
			var windowFeatures = "width=500,height=400,top=50,left=150,scrollbars=yes,resizable=yes";
			var url = "BookVendor.aspx?SSS_SectionsID=" + strOfSectionIDs
			var newWin = window.open(url, "", windowFeatures);
		}


		function showFacultyPopup(el, strOfFacultyIDs) {
			var windowFeatures = "width=500,height=400,top=50,left=150,scrollbars=yes,resizable=yes";
			var url = "FacultyDetail.aspx?ID=" + strOfFacultyIDs
			var newWin = window.open(url, "", windowFeatures);
		}
    </script>
</head>
<body>
    <form name="aspnetForm" method="post" action="results.aspx" id="aspnetForm">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__LASTFOCUS" id="__LASTFOCUS" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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FgIfAAUEZXZlbmQCAw8WAh8EaBYCZg8VAR1XaGl0aW5nIFNjaG9vbCBvZiBFbmdpbmVlcmluZ2QCBA8VAgpFTi42MDAuNDkyAjI4ZAIFD2QWAmYPFQIGNDE1MTExBjQxNTExMWQCBg8VARhDb21wIFNjaWVuY2UgV29ya3Nob3AgSUlkAggPFQMLU3ByaW5nIDIwMTQPSG9tZXdvb2QgQ2FtcHVzAGQCCg8VARFBcHByb3ZhbCBSZXF1aXJlZGQCCw8WAh8EaBYCAgEPZBYIAhUPFgIfAQL/////D2QCFw8WAh8BAv////8PZAIZDxYCHwEC/////w9kAhsPFgIfAQL/////D2QCCw8PFgIfBGhkFgZmDw8WBB8ABQs8PCBQcmV2aW91cx8EaGRkAgIPFgIfAQIBFgJmD2QWBAIBDw8WBB8DBQExHwRoZBYCZg8VAQExZAIDDw8WAh8EZ2QWAmYPFQEBMWQCBA8PFgYfAAUHTmV4dCA+Ph8DBQEyHwRoZGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFg8FV2N0bDAwJGNvbnRlbnQkcnB0Q3VycmVudENyaXRlcmlhJGN0bDAwJHJwdEN1cnJlbnRDcml0ZXJpYUZpbHRlcnMkY3RsMDAkaWJSZW1vdmVDcml0ZXJpYQVXY3RsMDAkY29udGVudCRycHRDdXJyZW50Q3JpdGVyaWEkY3RsMDEkcnB0Q3VycmVudENyaXRlcmlhRmlsdGVycyRjdGwwMCRpYlJlbW92ZUNyaXRlcmlhBVdjdGwwMCRjb250ZW50JHJwdEN1cnJlbnRDcml0ZXJpYSRjdGwwMiRycHRDdXJyZW50Q3JpdGVyaWFGaWx0ZXJzJGN0bDAwJGliUmVtb3ZlQ3JpdGVyaWEFV2N0bDAwJGNvbnRlbnQkcnB0Q3VycmVudENyaXRlcmlhJGN0bDAzJHJwdEN1cnJlbnRDcml0ZXJpYUZpbHRlcnMkY3RsMDAkaWJSZW1vdmVDcml0ZXJpYQUfY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRjYk1vbgUfY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRjYlR1ZQUfY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRjYldlZAUfY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRjYlRodQUfY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRjYkZyaQUfY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRjYlNhdAUfY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRjYlN1bgUiY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRyYkFsbERPVwUiY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRyYkFsbERPVwUiY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRyYkFueURPVwUiY3RsMDAkY29udGVudCROYXJyb3dCeURPVyRyYkFueURPV3cEQUzoHzK9L/q8SCFRNVl5BvOG" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<div>

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWLgL68PLRCQKepriNAwK68/COBgLwmLTpCALxu+n5BALrv97vCQLrv/LgBgLrv8aZDgLYgub3BALYgqqQDwLYgr6VBgLYguLUCgLYgtaIBQKc0bfDBQKn2rfDBQKawLfDBQLdybfDBQLJ7tHoBgLo1ul6AtfV+LcFAsaqs/YMApr/26UGAtr5+7wGAvLi2VECqubS6AMC1J7/kQ8Cxs+M/g0ChP/DpgYC75TR5gIC+JSJ5g0CtLOc5QwChJSG/wEC5MSzggoCyICg6AoCivCYmg4CzdDV4gwCiemWsQQC0bGJ4AICg6OtkQICjMz7/A4CjszH/A4Cj8z7/A4CiczH/A4Cisz7/A4Cqo2gqwkCvaeg9AUzBO9ykzb0Iz/XoghybX8HtCMk2w==" />
</div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/backgrd_stretch.gif">
	        <tr>
		      <td><div align="left"><img src="images/JHU3.gif" width="290" height="72" alt="Johns Hopkins University" /></div></td>
	          <td><div align="right"><img src="images/isis3.gif" width="570" height="72" alt="ISIS" /></div></td>
	        </tr>
			<tr width="100%" height="10px" bgcolor="#014274" bordercolor="#999999">
			  <td colspan="2">&nbsp;</td>
			</tr>
</table>

    <div>


    <h1>Search Results</h1>

    <table width="100%">
        <tr>
            <td valign="top" width="225">
                <a href="./">Start a New Search </a>
                <br />
                <br />
				<em>34 results</em> - <img src="images/print.gif" align="middle" alt="Print"/> <a href="javascript:window.print()">print this page</a>
                <br /><br />
                <strong>Current Search Criteria</strong><br/><br/>
                <table>

                       <tr><td valign="top"><strong>School: </strong></td><td>

                                Whiting School of Engineering (EN Computer Science)
                                <input type="image" name="ctl00$content$rptCurrentCriteria$ctl00$rptCurrentCriteriaFilters$ctl00$ibRemoveCriteria" id="ctl00_content_rptCurrentCriteria_ctl00_rptCurrentCriteriaFilters_ctl00_ibRemoveCriteria" src="images/redX.gif" alt="Remove Criteria" style="border-width:0px;" /><br/>

                     </td></tr>

                       <tr><td valign="top"><strong>Term: </strong></td><td>

                                Spring 2014
                                <input type="image" name="ctl00$content$rptCurrentCriteria$ctl01$rptCurrentCriteriaFilters$ctl00$ibRemoveCriteria" id="ctl00_content_rptCurrentCriteria_ctl01_rptCurrentCriteriaFilters_ctl00_ibRemoveCriteria" src="images/redX.gif" alt="Remove Criteria" style="border-width:0px;" /><br/>

                     </td></tr>

                       <tr><td valign="top"><strong>Level: </strong></td><td>

                                Upper Level Undergraduate
                                <input type="image" name="ctl00$content$rptCurrentCriteria$ctl02$rptCurrentCriteriaFilters$ctl00$ibRemoveCriteria" id="ctl00_content_rptCurrentCriteria_ctl02_rptCurrentCriteriaFilters_ctl00_ibRemoveCriteria" src="images/redX.gif" alt="Remove Criteria" style="border-width:0px;" /><br/>

                     </td></tr>

                       <tr><td valign="top"><strong>Location: </strong></td><td>

                                Homewood Campus
                                <input type="image" name="ctl00$content$rptCurrentCriteria$ctl03$rptCurrentCriteriaFilters$ctl00$ibRemoveCriteria" id="ctl00_content_rptCurrentCriteria_ctl03_rptCurrentCriteriaFilters_ctl00_ibRemoveCriteria" src="images/redX.gif" alt="Remove Criteria" style="border-width:0px;" /><br/>

                     </td></tr>

                </table>
                <br/>
                <div id="ctl00_content_pnlNarrow">

                <strong>Narrow Your Search</strong><br/>




<a onclick="toggleBox(this);return false;" style="text-decoration:none;color:black" href="#"><img src="images/bullet_arrow_down.gif" alt="arrow bullet" border="0" style="vertical-align:middle" /><span id="ctl00_content_NarrowSearchStatus_lblHeader">By Status</span></a><br />
<div style="margin-left:15px;margin-bottom:10px">

        <a id="ctl00_content_NarrowSearchStatus_rptNarrow_ctl00_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchStatus$rptNarrow$ctl00$lbFilter','')">Approval Required</a>
        (4)<br />

        <a id="ctl00_content_NarrowSearchStatus_rptNarrow_ctl01_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchStatus$rptNarrow$ctl01$lbFilter','')">Open</a>
        (25)<br />

        <a id="ctl00_content_NarrowSearchStatus_rptNarrow_ctl02_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchStatus$rptNarrow$ctl02$lbFilter','')">Waitlist Only</a>
        (5)<br />

</div>



<a onclick="toggleBox(this);return false;" style="text-decoration:none;color:black" href="#"><img src="images/bullet_arrow_down.gif" alt="arrow bullet" border="0" style="vertical-align:middle" /><span id="ctl00_content_NarrowSearchDepartment_lblHeader">By Department</span></a><br />
<div style="margin-left:15px;margin-bottom:10px">

        <a id="ctl00_content_NarrowSearchDepartment_rptNarrow_ctl00_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchDepartment$rptNarrow$ctl00$lbFilter','')">AS Philosophy</a>
        (1)<br />

        <a id="ctl00_content_NarrowSearchDepartment_rptNarrow_ctl01_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchDepartment$rptNarrow$ctl01$lbFilter','')">EN Biomedical Engineering</a>
        (2)<br />

        <a id="ctl00_content_NarrowSearchDepartment_rptNarrow_ctl02_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchDepartment$rptNarrow$ctl02$lbFilter','')">EN Computer Science</a>
        (34)<br />

        <a id="ctl00_content_NarrowSearchDepartment_rptNarrow_ctl03_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchDepartment$rptNarrow$ctl03$lbFilter','')">EN Electrical & Computer Engineering</a>
        (2)<br />

        <a id="ctl00_content_NarrowSearchDepartment_rptNarrow_ctl04_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchDepartment$rptNarrow$ctl04$lbFilter','')">EN Information Security Institute</a>
        (3)<br />

</div>

<a onclick="toggleBox(this);return false;" style="text-decoration:none;color:black" href="#"><img src="images/bullet_arrow_down.gif" alt="arrow bullet" border="0" style="vertical-align:middle" /><span id="ctl00_content_NarrowSearchCredits_lblHeader">By Credits</span></a><br />
<div style="margin-left:15px;margin-bottom:10px">

        <a id="ctl00_content_NarrowSearchCredits_rptNarrow_ctl00_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchCredits$rptNarrow$ctl00$lbFilter','')">0.00</a>
        (4)<br />

        <a id="ctl00_content_NarrowSearchCredits_rptNarrow_ctl01_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchCredits$rptNarrow$ctl01$lbFilter','')">1.00</a>
        (2)<br />

        <a id="ctl00_content_NarrowSearchCredits_rptNarrow_ctl02_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchCredits$rptNarrow$ctl02$lbFilter','')">3.00</a>
        (27)<br />

        <a id="ctl00_content_NarrowSearchCredits_rptNarrow_ctl03_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchCredits$rptNarrow$ctl03$lbFilter','')">4.00</a>
        (1)<br />

</div>

<a onclick="toggleBox(this);return false;" style="text-decoration:none;color:black" href="#"><img src="images/bullet_arrow_down.gif" alt="arrow bullet" border="0" style="vertical-align:middle" /><span id="ctl00_content_NarrowSearchTimeOfDay_lblHeader">By Time</span></a><br />
<div style="margin-left:15px;margin-bottom:10px">

        <a id="ctl00_content_NarrowSearchTimeOfDay_rptNarrow_ctl00_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchTimeOfDay$rptNarrow$ctl00$lbFilter','')">Morning</a>
        (6)<br />

        <a id="ctl00_content_NarrowSearchTimeOfDay_rptNarrow_ctl01_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchTimeOfDay$rptNarrow$ctl01$lbFilter','')">Afternoon</a>
        (22)<br />

        <a id="ctl00_content_NarrowSearchTimeOfDay_rptNarrow_ctl02_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchTimeOfDay$rptNarrow$ctl02$lbFilter','')">Evening</a>
        (1)<br />

        <a id="ctl00_content_NarrowSearchTimeOfDay_rptNarrow_ctl03_lbFilter" href="javascript:__doPostBack('ctl00$content$NarrowSearchTimeOfDay$rptNarrow$ctl03$lbFilter','')">Other</a>
        (5)<br />

</div>

<a onclick="toggleBox(this);return false;" style="text-decoration:none;color:black" href="#"><img src="images/bullet_arrow_down.gif" alt="arrow bullet" border="0" style="vertical-align:middle" />By Day(s) Of Week</a><br />
<div style="margin-left:15px;margin-bottom:10px">

<table cellpadding="0" cellspacing="0" style="margin-left:10px;">
							<tr>
								<td class="labelInfo" valign="bottom" align="center">Mo</td>
								<td class="labelInfo" valign="bottom" align="center">Tu</td>
								<td class="labelInfo" valign="bottom" align="center">We</td>
								<td class="labelInfo" valign="bottom" align="center">Th</td>
								<td class="labelInfo" valign="bottom" align="center">Fr</td>
								<td class="labelInfo" valign="bottom" align="center">Sa</td>
								<td class="labelInfo" valign="bottom" align="center">Su</td>
							</tr>
							<tr>
								<td valign="top" align="center"><span title="Monday" style="width:25px;">
								    <input id="ctl00_content_NarrowByDOW_cbMon" type="checkbox" name="ctl00$content$NarrowByDOW$cbMon" />
								</span></td>
								<td valign="top" align="center"><span title="Tuesday" style="width:25px;">
								    <input id="ctl00_content_NarrowByDOW_cbTue" type="checkbox" name="ctl00$content$NarrowByDOW$cbTue" />
								</span></td>
								<td valign="top" align="center"><span title="Wednesday" style="width:25px;">
								    <input id="ctl00_content_NarrowByDOW_cbWed" type="checkbox" name="ctl00$content$NarrowByDOW$cbWed" />
								</span></td>
								<td valign="top" align="center"><span title="Thursday" style="width:25px;">
								    <input id="ctl00_content_NarrowByDOW_cbThu" type="checkbox" name="ctl00$content$NarrowByDOW$cbThu" />
								</span></td>
								<td valign="top" align="center"><span title="Friday" style="width:25px;">
								    <input id="ctl00_content_NarrowByDOW_cbFri" type="checkbox" name="ctl00$content$NarrowByDOW$cbFri" />
								</span></td>
								<td valign="top" align="center"><span title="Saturday" style="width:25px;">
								    <input id="ctl00_content_NarrowByDOW_cbSat" type="checkbox" name="ctl00$content$NarrowByDOW$cbSat" />
								</span></td>
								<td valign="top" align="center"><span title="Sunday" style="width:8px;">
								    <input id="ctl00_content_NarrowByDOW_cbSun" type="checkbox" name="ctl00$content$NarrowByDOW$cbSun" />
								</span></td>
							</tr>
	  </table>
	&nbsp;&nbsp;<input id="ctl00_content_NarrowByDOW_rbAllDOW" type="radio" name="ctl00$content$NarrowByDOW$NarrowByDOW" value="rbAllDOW" onclick="javascript:setTimeout('__doPostBack(\'ctl00$content$NarrowByDOW$rbAllDOW\',\'\')', 0)" /><label for="ctl00_content_NarrowByDOW_rbAllDOW">On the <strong>exact</strong> days</label><br />
	&nbsp;&nbsp;<input id="ctl00_content_NarrowByDOW_rbAnyDOW" type="radio" name="ctl00$content$NarrowByDOW$NarrowByDOW" value="rbAnyDOW" onclick="javascript:setTimeout('__doPostBack(\'ctl00$content$NarrowByDOW$rbAnyDOW\',\'\')', 0)" /><label for="ctl00_content_NarrowByDOW_rbAnyDOW">On <strong>any</strong> of the days</label>
	<br/>
</div>
                <br/>

</div>
            </td>
            <td valign="top" >
            <div id="ctl00_content_pnlResults">

            <table width="100%">
            <tr>
            <td>

                <div align="right">

                    sort by
                    <select name="ctl00$content$ddlSortBy" onchange="javascript:setTimeout('__doPostBack(\'ctl00$content$ddlSortBy\',\'\')', 0)" id="ctl00_content_ddlSortBy">
		<option value="School">School</option>
		<option selected="selected" value="CourseNumber">Class #</option>
		<option value="Term">Term</option>
		<option value="Location">Location</option>
		<option value="Instructor">Instructor</option>
		<option value="Status">Status</option>
		<option value="DayTime">Day/Time</option>

	</select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <select name="ctl00$content$ddlResultsPerPage" onchange="javascript:setTimeout('__doPostBack(\'ctl00$content$ddlResultsPerPage\',\'\')', 0)" id="ctl00_content_ddlResultsPerPage">
		<option value="15">15</option>
		<option value="30">30</option>
		<option value="45">45</option>
		<option value="60">60</option>
		<option value="75">75</option>
		<option selected="selected" value="100">100</option>

	</select>
                    per page



                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div align="right">
                <a id="ctl00_content_lbShowHideDetails" href="javascript:__doPostBack('ctl00$content$lbShowHideDetails','')">[Expand All]</a>&nbsp;&nbsp;&nbsp;

                </div>
            </td>
        </tr>
        <tr>
            <td valign="top">


                    <table width="100%" border="0" id="results">
                    <tr class="header">

                        <td style="width:100px">Class #</td>
                        <td>Title</td>
                        <td>Term</td>
                        <td nowrap="nowrap">Location</td>
                        <td>Day-Times</td>
                        <td>Instructor(s)</td>
                        <td>Status</td>
                    </tr>

                    <tr class="odd">

                        <td style="width:100px">EN.520.434 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412652" onclick="showClassDetails(this,412652);return false;">
                            Modern Biomedical Imaging Instrumentation and Techniques
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 9:00AM - 10:15AM</td>
                        <td>

                            <span>B. Tsui</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.520.447 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_417692" onclick="showClassDetails(this,417692);return false;">
                            Information Theory
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MWF 1:30PM - 2:20PM</td>
                        <td>

                            <span>S. Khudanpur</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.580.473 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412884" onclick="showClassDetails(this,412884);return false;">
                            Modern Biomedical Imaging Instrumentation and Techniques
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 9:00AM - 10:15AM</td>
                        <td>

                            <span>B. Tsui</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.316 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412855" onclick="showClassDetails(this,412855);return false;">
                            Database Systems
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MW 12:00PM - 1:15PM</td>
                        <td>

                            <span>Y. Ahmad</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.318 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415138" onclick="showClassDetails(this,415138);return false;">
                            Operating Systems
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MWF 10:00AM - 10:50AM</td>
                        <td>

                            <span>P. Froehlich</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.320 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412829" onclick="showClassDetails(this,412829);return false;">
                            Parallel Programming
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MW 4:30PM - 5:45PM</td>
                        <td>

                            <span>R. Burns</span>
                        </td>
                        <td>Waitlist Only</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.325 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412184" onclick="showClassDetails(this,412184);return false;">
                            Declarative Methods
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MWF 3:00PM - 4:15PM</td>
                        <td>

                            <span>J. Eisner</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.335 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412185" onclick="showClassDetails(this,412185);return false;">
                            Artificial Intelligence
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>WF 12:00PM - 1:15PM</td>
                        <td>

                            <span>B. Mitchell</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.344 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412186" onclick="showClassDetails(this,412186);return false;">
                            Computer Network Fundamentals
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 4:30PM - 5:45PM</td>
                        <td>

                            <span>A. DeSimone</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.355 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415114" onclick="showClassDetails(this,415114);return false;">
                            Video Game Design Project
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>W 4:30PM - 7:30PM</td>
                        <td>

                            <span>P. Froehlich</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.363 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412707" onclick="showClassDetails(this,412707);return false;">
                            Introduction To Algorithms
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 9:00AM - 10:15AM</td>
                        <td>

                            <span>V. Braverman</span>
                        </td>
                        <td>Waitlist Only</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.402 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412917" onclick="showClassDetails(this,412917);return false;">
                            Medical Informatics
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MW 4:30PM - 5:45PM</td>
                        <td>

                            <span>H. Lehmann</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.411 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_416733" onclick="showClassDetails(this,416733);return false;">
                            Computer Science Innovation & Entrepreneurship II
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>F 6:00PM - 9:00PM</td>
                        <td>

                            <a href="#" onclick="showFacultyPopup(this,1381);return false;">L. Aronhime</a><span>, </span><span> A. Dahbura</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.416 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412856" onclick="showClassDetails(this,412856);return false;">
                            Database Systems
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MW 12:00PM - 1:30PM</td>
                        <td>

                            <span>Y. Ahmad</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.418 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415141" onclick="showClassDetails(this,415141);return false;">
                            Operating Systems
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MWF 10:00AM - 10:50AM</td>
                        <td>

                            <span>P. Froehlich</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.420 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412830" onclick="showClassDetails(this,412830);return false;">
                            Parallel Programming
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MW 4:30PM - 5:45PM</td>
                        <td>

                            <span>R. Burns</span>
                        </td>
                        <td>Waitlist Only</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.424 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412674" onclick="showClassDetails(this,412674);return false;">
                            Network Security
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 3:00PM - 4:15PM</td>
                        <td>

                            <span>S. Nielson</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.425 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412187" onclick="showClassDetails(this,412187);return false;">
                            Declarative Methods
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MWF 3:00PM - 4:15PM</td>
                        <td>

                            <span>J. Eisner</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.426 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412188" onclick="showClassDetails(this,412188);return false;">
                            Principles of Programming Languages
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MW 1:30PM - 2:45PM</td>
                        <td>

                            <span>S. Smith</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.430 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415147" onclick="showClassDetails(this,415147);return false;">
                            Ontologies and Knowledge Representation
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 1:30PM - 2:45PM</td>
                        <td>

                            <span>R. Rynasiewicz</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.435 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412189" onclick="showClassDetails(this,412189);return false;">
                            Artificial Intelligence
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>WF 12:00PM - 1:15PM</td>
                        <td>

                            <span>B. Mitchell</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.436 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412928" onclick="showClassDetails(this,412928);return false;">
                            Algorithms for Sensor-Based Robotics
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 12:00PM - 1:15PM</td>
                        <td>

                            <span>G. Hager</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.444 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412190" onclick="showClassDetails(this,412190);return false;">
                            Computer Networks
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 4:30PM - 5:45PM</td>
                        <td>

                            <span>A. DeSimone</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.446 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412191" onclick="showClassDetails(this,412191);return false;">
                            Computer Integrated Surgery II
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 1:30PM - 2:45PM</td>
                        <td>

                            <span>R. Taylor</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.452 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412192" onclick="showClassDetails(this,412192);return false;">
                            Seminar: Computer Integrated Surgery II
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 1:30PM - 2:45PM</td>
                        <td>

                            <span>R. Taylor</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.454 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415144" onclick="showClassDetails(this,415144);return false;">
                            Practical Cryptographic Systems
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MW 3:00PM - 4:15PM</td>
                        <td>

                            <span>M. Green</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.463 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412708" onclick="showClassDetails(this,412708);return false;">
                            Algorithms I
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 9:00AM - 10:15AM</td>
                        <td>

                            <span>V. Braverman</span>
                        </td>
                        <td>Waitlist Only</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.466 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_412918" onclick="showClassDetails(this,412918);return false;">
                            Information Retrieval and Web Agents
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 3:00PM - 4:15PM</td>
                        <td>

                            <span>D. Yarowsky</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.468 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415113" onclick="showClassDetails(this,415113);return false;">
                            Machine Translation
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>TTh 1:30PM - 2:45PM</td>
                        <td>

                            <span>A. Lopez, </span><span> M. Post</span>
                        </td>
                        <td>Open</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.475 (01)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415148" onclick="showClassDetails(this,415148);return false;">
                            Machine Learning
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td>MW 1:30PM - 2:45PM</td>
                        <td>

                            <span>M. Dredze</span>
                        </td>
                        <td>Waitlist Only</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.492 (05)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415108" onclick="showClassDetails(this,415108);return false;">
                            Comp Science Workshop II
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td></td>
                        <td>

                            <span>S. Smith</span>
                        </td>
                        <td>Approval Required</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.492 (06)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415109" onclick="showClassDetails(this,415109);return false;">
                            Comp Science Workshop II
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td></td>
                        <td>

                            <span>J. Selinski</span>
                        </td>
                        <td>Approval Required</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="odd">

                        <td style="width:100px">EN.600.492 (13)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415110" onclick="showClassDetails(this,415110);return false;">
                            Comp Science Workshop II
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td></td>
                        <td>

                            <span>D. Yarowsky</span>
                        </td>
                        <td>Approval Required</td>
                    </tr>
                    <tr style="display:none"></tr>



                    <tr class="even">

                        <td style="width:100px">EN.600.492 (28)</td>
                        <td class="icon-none-16-right">
                            <a href="#" id="blah_415111" onclick="showClassDetails(this,415111);return false;">
                            Comp Science Workshop II
                            [+]</a>
                        </td>
                        <td>Spring 2014</td>
                        <td>Homewood Campus</td>
                        <td></td>
                        <td>

                            <span>P. Froehlich</span>
                        </td>
                        <td>Approval Required</td>
                    </tr>
                    <tr style="display:none"></tr>



                    </table>


            </td>
        </tr>
        <tr>
            <td>
                <div align="right">

                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;

            </td>
        </tr>
    </table>
	<div>
	<em>Please note that the class sections displayed are for planning purposes only, and information such as dates, times, locations, and instructors are subject to change.</em>
	</div>

</div>

    </td>
            </tr>
            </table>

    </div>

    </form>
</body>
</html>
