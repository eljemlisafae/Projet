<html>
    <head>
        <title>JS to Excel</title>

    </head>
    <body>
	
        <div class="x_content">
		<table id="datatable" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Nom</th>
					<th>Chambre</th>
					<th>Reference</th>
					<th>Nbre/Pax</th>
					<th>Date départ</th>
					<th>Observation</th>
				</tr>
			</thead>
			<tbody>
			
				<tr>
					<td>a</td>
					<td>b</td>
					<td>c</td>
					<td>d</td>
					<td>d</td>
					<td>e</td>
				</tr>
			
				
				
			</tbody>
		</table>
	</div>
	
	
	
	
	<div class="x_content">
		<table id="datatables" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Nom</th>
					<th>Chambre</th>
					<th>Reference</th>
					<th>Nbre/Pax</th>
					<th>Date départ</th>
					<th>Observation</th>
				</tr>
			</thead>
			<tbody>
			
				<tr>
					<td>a</td>
					<td>b</td>
					<td>c</td>
					<td>d</td>
					<td>d</td>
					<td>e</td>
				</tr>
			
				
				
			</tbody>
		</table>
	</div>
	
	<div class="x_content">
		<table id="datatabless" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Nom</th>
					<th>Chambre</th>
					<th>Reference</th>
					<th>Nbre/Pax</th>
					<th>Date départ</th>
					<th>Observation</th>
				</tr>
			</thead>
			<tbody>
			
				<tr>
					<td>a</td>
					<td>b</td>
					<td>c</td>
					<td>d</td>
					<td>d</td>
					<td>e</td>
				</tr>
			
				
				
			</tbody>
		</table>
	</div>
	
        <a id="dlink"  style="display:none;"></a>
        <input type="button" onclick="tablesToExcel(['datatable','datatables','datatabless'], ['first', 'second','third'], 'myfile.xls')" value="Export to Excel">
        <script src="~/Views/JS/JSExcel.js" type="text/javascript"></script>
		<script>
			var tablesToExcel = (function () {
    var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets>'
    , templateend = '</x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head>'
    , body = '<body>'
    , tablevar = '<table>{table'
    , tablevarend = '}</table>'
    , bodyend = '</body></html>'
    , worksheet = '<x:ExcelWorksheet><x:Name>'
    , worksheetend = '</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet>'
    , worksheetvar = '{worksheet'
    , worksheetvarend = '}'
    , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
    , wstemplate = ''
    , tabletemplate = '';

    return function (table, name, filename) {
        var tables = table;

        for (var i = 0; i < tables.length; ++i) {
            wstemplate += worksheet + worksheetvar + i + worksheetvarend + worksheetend;
            tabletemplate += tablevar + i + tablevarend;
        }

        var allTemplate = template + wstemplate + templateend;
        var allWorksheet = body + tabletemplate + bodyend;
        var allOfIt = allTemplate + allWorksheet;

        var ctx = {};
        for (var j = 0; j < tables.length; ++j) {
            ctx['worksheet' + j] = name[j];
        }

        for (var k = 0; k < tables.length; ++k) {
            var exceltable;
            if (!tables[k].nodeType) exceltable = document.getElementById(tables[k]);
            ctx['table' + k] = exceltable.innerHTML;
        }

        //document.getElementById("dlink").href = uri + base64(format(template, ctx));
        //document.getElementById("dlink").download = filename;
        //document.getElementById("dlink").click();

        window.location.href = uri + base64(format(allOfIt, ctx));

    }
})();

		
		
		</script>
    </body>
</html>