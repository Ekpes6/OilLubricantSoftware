<%--
    Document   : invoice_datatable
    Created on : Mar 22, 2021, 11:25:17 AM
    Author     : EKPES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
        <!--<link rel="stylesheet" href="css/font-awesome.min.css">-->
        <link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
        <!--<link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/AdminLTE.min.css">
        <link rel="stylesheet" href="css/_all-skins.min.css">-->
        <title>Invoice table</title>
    </head>
    <body>
        <div class="box mod" id="invoice_slip">

            <!-- /.box-header -->
            <div class="box-body" >
                <br><br>

                <table id="allinvoices" class="table table-bordered table-striped display hover">
                    <thead>
                        <tr>
                            <th>DN NUMBER</th>
                            <th>INVOICE NUMBER</th>
                            <th>DATE</th>
                            <th>PRODUCT</th>
                            <th>TOTAL QUANTITY</th>
                            <th>UNIT AMOUNT</th>
                            <th>TOTAL AMOUNT</th>
                            <th>EASTERN TERITORY</th>
                            <th>VENDOR MGR.</th>
                            <th>FROM</th>
                            <th>TO</th>
                            <th>ACCOUNT CODE</th>
                            <th>PLANT CODE</th>


                        </tr>
                    </thead>
                    <tbody>


                    </tbody>

                    <tfoot>
                        <tr>
                            <th>DN NUMBER</th>
                            <th>INVOICE NUMBER</th>
                            <th>DATE</th>
                            <th>PRODUCT</th>
                            <th>TOTAL QUANTITY</th>
                            <th>UNIT AMOUNT</th>
                            <th>TOTAL AMOUNT</th>
                            <th>EASTERN TERITORY</th>
                            <th>VENDOR MGR.</th>
                            <th>FROM</th>
                            <th>TO</th>
                            <th>ACCOUNT CODE</th>
                            <th>PLANT CODE</th>
                        </tr>
                    </tfoot>
                </table>

            </div>
            <!-- /.box-body -->
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <!-- DataTables -->
        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/dataTables.bootstrap.min.js"></script>

        <!--<script src="js/adminlte.min.js"></script>-->
        <script src="js/numeral.min.js"></script>
        <!--<script src="js/demo.js"></script>-->
        <script>
            $(document).ready(function(){

                    $(function(){
    $("#datepicker").datepicker({format: 'dd-mm-yyyy'});

    });


                // Setup - add a text input to each footer cell
                $('#allinvoices tfoot th').each(function(){
                    var title = $(this).text();
                    if(title === "DATE")
                    {
                        $(this).html('<input type="text" id="datepicker" placeholder="Search ' + title + '" />');
                    }else
                    {
                        $(this).html('<input type="text" placeholder="Search ' + title + '" />');
                    }
                });

                var table2 = $('#allinvoices').DataTable({
                    ///ignore this one///////////////////////////
                    footerCallback: function(row, data, start, end, display){
                        var api = this.api(), data;
                        // Remove the formatting to get integer data for summation
                        var intVal = function(i){
                            return typeof i === 'string' ?
                                    i.replace(/[\$,]/g, '') * 1 :
                                    typeof i === 'number' ?
                                    i : 0;
                        };
                        var totalColumn = function(colNum, colName, colSign){
                            // Total over all pages
                            total = api
                                    .column(colNum)
                                    .data()
                                    .reduce(function(a, b){
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            // Total over this page
                            pageTotal = api
                                    .column(colNum, {page: 'current'})
                                    .data()
                                    .reduce(function(a, b){
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            // Update footer
                            $(api.column(colNum).footer()).html(
                                    '' + colSign + '' + numeral(pageTotal).format('0,0.00') + ' (' + colName + ')'
                                    );
                        };
                        totalColumn(4, "Cummulative Quantity", "");
                        totalColumn(5, "Cum: Unit Cost", "&#8358;");
                        totalColumn(6, "Cum: Total Cost", "&#8358;");

                    },
                    ///ignore this one/////////////////////////////
                    Filter: true,
                    processing: true,
                    responsive: false,
                    scrollY: 300,
                    scrollX: true,
                    deferRender: true,
                    serverSide: true,
                    ajax: {
                        url: 'all_invoices',
                        dataType: 'json',
                        type: 'POST'

                    },
                    columnDefs: [
                        {visible: true,
                            type: 'numeric-comma',
                            targets: [5, 6],
                            render: function(data, type, row, meta){
                                return numeral(data).format('0,0.00');
                            }}],
                    /* search: {
                     search: search_value+" "+search_value2+" "+search_value3+" "+search_value4},*/
                    columns: [
                        {data: 'dnNum'},
                        {data: 'invoice_n'},
                        {data: 'daten'},
                        {data: 'prod_name'},
                        {data: 'r_qty'},
                        {data: 'u_cost'},
                        {data: 't_cost'},
                        {data: 'eastern_teritory'},
                        {data: 'vendor_mgr'},
                        {data: 'frompicker'},
                        {data: 'topicker'},
                        {data: 'acct_code'},
                        {data: 'plant_code'}
                    ]
                });
                $('#allinvoices tbody').on('click', 'tr', function(){
                    if($(this).hasClass('selected')){
                        $(this).removeClass('selected');
                    }else{
                        table2.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                    }
                });
///ignore this one///////////////////////////
// Apply the search
                table2.columns().every(function(){
                    var that = this;
                    $('input', this.footer()).on('keydown', function(ev){
                        if(ev.keyCode === 13){ //only on enter keypress (code 13)
                            that.search(this.value).draw();
                        }
                    });
                });
///ignore this one///////////////////////////
//
                $('a.toggle-vis').on('click', function(e){
                    e.preventDefault();
                    // Get the column API object
                    var column = table2.column($(this).attr('data-column'));
                    // Toggle the visibility
                    column.visible(!column.visible());
                });
            });
        </script>
    </body>
</html>
