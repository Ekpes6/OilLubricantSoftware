<%--
    Document   : index
    Created on : Mar 22, 2021, 11:25:37 AM
    Author     : EKPES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Invoice slip software</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
            th, td {
                padding: 5px;
                text-align: left;
            }
        </style>
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6" style="background-color:lavender;">
                    <br>
                    Total Nigeria Plc<br>
                    Eastern Teritory<br>
                    <div class="row">
                        <div class="col-sm-6" style="background-color:lavender;">
                            <input id="eastern_teritory" type="text"  class="form-control"/>
                        </div>
                        <div class="col-sm-6" style="background-color:lavenderblush;">
                            Sales Area<br><br>
                        </div>
                    </div>
                    <div class="row" style="border-style: solid; padding: 5px;">
                        <div class="col-sm-6" style="background-color:lavender;">
                            VENDOR MANAGEMENT:
                        </div>
                        <div class="col-sm-6">
                            <input id="vendor_mgr" type="text" placeholder="Vendor Management" class="form-control"/>
                        </div>
                    </div>

                </div>
                <div class="col-sm-6" style="background-color:lavenderblush;">
                    <br>
                    <div style="border-style: solid; padding: 5px;">Period:</div>
                    <div style="border-style: solid; padding: 5px;">
                        <div class="row">
                            <div class="col-sm-2">
                                FROM:
                            </div>
                            <div class="col-sm-10">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control pull-right" id="frompicker">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div style="border-style: solid; padding: 5px;">
                        <div class="row">
                            <div class="col-sm-2">
                                TO:
                            </div>
                            <div class="col-sm-10">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control pull-right" id="topicker">
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>

                </div>

            </div>
            <div class="row">
                <div class="col-sm-6" style="background-color:lavender;">
                    WEEKLY CONSUMPTION SUMMARY &nbsp;&nbsp;<b>Invoice #: <span id="invoice_n"></span></b></div>
                <div class="col-sm-6" style="background-color:lavender;">
                    <div style="border-style: solid; padding: 5px;">
                        <div class="row">
                            <div class="col-sm-4">
                                ACCOUNT CODE:
                            </div>
                            <div class="col-sm-8">
                                <input id="acct_code" type="text" class="form-control" placeholder="ACCOUNT CODE"/>
                            </div>
                        </div>
                    </div>
                    <div style="border-style: solid; padding: 5px;">
                        <div class="row">
                            <div class="col-sm-4">
                                PLANT CODE:
                            </div>
                            <div class="col-sm-8">
                                <input id="plant_code" type="text" class="form-control" placeholder="PLANT CODE"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <table id="invoice_review" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>S/NO</th>
                                <th>DN NUMBER</th>
                                <th>DATE</th>
                                <th>PRODUCT</th>
                                <th>TOTAL QUANTITY</th>
                                <th>TOTAL AMOUNT</th>
                               <!-- <th>TOTAL AMOUNT</th>-->

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td class="dnNumber1" id="dnNumber10"></td>
                                <td class="dnDate1" id="dnDate10"></td>
                                <td class="dnProduct1" id="dnProduct10"></td>
                                <td class="dnQty1" id="dnQty10"></td>
                                <td class="dnAmt1" id="dnAmt10"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt0"></td>-->

                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="dnNumber1" id="dnNumber11"></td>
                                <td class="dnDate1" id="dnDate11"></td>
                                <td class="dnProduct1" id="dnProduct11"></td>
                                <td class="dnQty1" id="dnQty11"></td>
                                <td class="dnAmt1" id="dnAmt11"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt1"></td>-->
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="dnNumber1" id="dnNumber12"></td>
                                <td class="dnDate1" id="dnDate12"></td>
                                <td class="dnProduct1" id="dnProduct12"></td>
                                <td class="dnQty1" id="dnQty12"></td>
                                <td class="dnAmt1" id="dnAmt12"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt2"></td>-->

                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="dnNumber1" id="dnNumber13"></td>
                                <td class="dnDate1" id="dnDate13"></td>
                                <td class="dnProduct1" id="dnProduct13"></td>
                                <td class="dnQty1" id="dnQty13"></td>
                                <td class="dnAmt1" id="dnAmt13"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt3"></td>-->

                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="dnNumber1" id="dnNumber14"></td>
                                <td class="dnDate1" id="dnDate14"></td>
                                <td class="dnProduct1" id="dnProduct14"></td>
                                <td class="dnQty1" id="dnQty14"></td>
                                <td class="dnAmt1" id="dnAmt14"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt4"></td>-->


                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="dnNumber1" id="dnNumber15"></td>
                                <td class="dnDate1" id="dnDate15"></td>
                                <td class="dnProduct1" id="dnProduct15"></td>
                                <td class="dnQty1" id="dnQty15"></td>
                                <td class="dnAmt1" id="dnAmt15"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt5"></td>-->

                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="dnNumber1" id="dnNumber16"></td>
                                <td class="dnDate1" id="dnDate16"></td>
                                <td class="dnProduct1" id="dnProduct16"> </td>
                                <td class="dnQty1" id="dnQty16"></td>
                                <td class="dnAmt1" id="dnAmt16"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt6"></td>-->

                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="dnNumber1" id="dnNumber17"></td>
                                <td class="dnDate1" id="dnDate17"></td>
                                <td class="dnProduct1" id="dnProduct17"></td>
                                <td class="dnQty1" id="dnQty17"></td>
                                <td class="dnAmt1" id="dnAmt17"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt7"></td>-->
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="dnNumber1" id="dnNumber18"></td>
                                <td class="dnDate1" id="dnDate18"></td>
                                <td class="dnProduct1" id="dnProduct18"></td>
                                <td class="dnQty1" id="dnQty18"></td>
                                <td class="dnAmt1" id="dnAmt18"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt8"></td>-->

                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="dnNumber1" id="dnNumber19"></td>
                                <td class="dnDate1" id="dnDate19"></td>
                                <td class="dnProduct1" id="dnProduct19"></td>
                                <td class="dnQty1" id="dnQty19"></td>
                                <td class="dnAmt1" id="dnAmt19"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt9"></td>-->
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="dnNumber1" id="dnNumber110"></td>
                                <td class="dnDate1" id="dnDate110"></td>
                                <td class="dnProduct1" id="dnProduct110"></td>
                                <td class="dnQty1" id="dnQty110"></td>
                                <td class="dnAmt1" id="dnAmt110"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt10"></td>-->
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="dnNumber1" id="dnNumber111"></td>
                                <td class="dnDate1" id="dnDate111"></td>
                                <td class="dnProduct1" id="dnProduct111"></td>
                                <td class="dnQty1" id="dnQty111"></td>
                                <td class="dnAmt1" id="dnAmt111"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt11"></td>-->
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="dnNumber1" id="dnNumber112"></td>
                                <td class="dnDate1" id="dnDate112"></td>
                                <td class="dnProduct1" id="dnProduct112"></td>
                                <td class="dnQty1" id="dnQty112"></td>
                                <td class="dnAmt1" id="dnAmt112"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt12"></td>-->
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="dnNumber1" id="dnNumber113"></td>
                                <td class="dnDate1" id="dnDate113"></td>
                                <td class="dnProduct1" id="dnProduct113"></td>
                                <td class="dnQty1" id="dnQty113"></td>
                                <td class="dnAmt1" id="dnAmt113"></td>
                                <!--<td class="dnTAmt1" id="dnTAmt13"></td>-->
                            </tr>
                            <tr>
                                <td>TOTAL</td>
                                <td colspan="3"></td>
                                <td id="grandQTY"></td>
                                <td></td>
                               <!-- <td colspan="1" id="grandTn"></td>-->

                            </tr>

                        </tbody>
                    </table>

                </div>


            </div>
            <div style="text-align: right; font-">Amount in words: <span id="amtWords">----------------------------------------------------------------------------------------------<br>
                    -----------------------------------------------------------------------------------------------------<br>
                    <br></span></div>


            <div class="row" style="text-align: center">
                <div class="col-sm-6">
                    CUSTOMER SIGN
                </div>
                <div class="col-sm-6">
                    DEALER'S SIGN
                </div>
            </div><br>
            <div class="row" style="text-align: center">
                <div class="col-sm-6">
                    -----------------
                </div>
                <div class="col-sm-6">
                    -----------------
                </div>
            </div>
            <br>
            <button id="postInvoice" type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Post Invoice
            </button>
            <a id="showDatabase" href="invoice_datatable.jsp" target="_blank" class="btn btn-primary pull-right"><i class="fa fa-print"></i> Open Invoice</a>
            <button id="rePrtInvoice" type="button" class="btn btn-danger pull-right"><i class="fa fa-print"></i> Reprint Invoice
            </button>&nbsp;<input style=" float: right;" type='text' id='reGenInvoice' class='form-control pull-right' placeholder='Type in an invoice number, press enter' />
            <br><br>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <script src="js/numeral.min.js"></script>
        <script>
            $(document).ready(function(){
                $('#reGenInvoice').hide();
                $('#frompicker').datepicker({format: 'dd-mm-yyyy', autoclose: true});
                $('#topicker').datepicker({format: 'dd-mm-yyyy', autoclose: true});
                //Checking if there is an invoice number already inserted into the database, if not create an invoice key
                $.ajax({
                    url: 'invoice_check',
                    type: 'GET',
                    cache: false,
                    success: function(data){
                        $('#invoice_n').html(data);

                    },
                    error: function(xhr, status, error){
                        var acc = [];
                        $.each(xhr, function(index, value){
                            acc.push(index + ': ' + value);
                        });
                        alert(JSON.stringify(acc));
                    }
                });

               /* for(var i = 0; i < 14; i++)
                {
                    $("#dnDate" + i + "").datepicker({format: 'yyyy-mm-dd'});

                }*/

                $(".dnNumber1").each(function(index)
                {
                    $(this).dblclick(function()
                    {
                        var nNum = $(this);
                        var dnEmpty = nNum.text();
                        if(dnEmpty === "")
                        {
                            nNum.html("<input type='text' id='dnNumber" + index + "' class='form-control' placeholder='DN Number' />").focus();
                            $("#dnNumber" + index + "").on('blur', function(){
                                var dn = $(this).val();
                                nNum.html(dn);
                                $(this).hide();

                            }).focus();
                        }else
                        {
                            nNum.html("<input type='text' id='dnNumber" + index + "' class='form-control' placeholder='DN Number' value='" + dnEmpty + "'/>");
                            $("#dnNumber" + index + "").on('blur', function(){
                                var dn = $(this).val();
                                nNum.html(dn);
                                $(this).hide();
                            }).focus();
                        }
                    });
                });

                //////////dnDate
                $(".dnDate1").each(function(index)
                {
                    $(this).dblclick(function()
                    {
                        var nNum = $(this);
                        var dnEmpty = nNum.text();
                        if(dnEmpty === "")
                        {
                            nNum.html("<input type='text' id='dnDate" + index + "' class='form-control' placeholder='dd-mm-yyyy' />");
                            $("#dnDate" + index + "").on('blur', function(){
                                var dn = $(this).val();
                                nNum.html(dn);
                                $(this).hide();
                            }).focus();
                        }else
                        {
                            nNum.html("<input type='text' id='dnDate" + index + "' class='form-control' placeholder='01-01-2020' value='" + dnEmpty + "'/>");
                            $("#dnDate" + index + "").on('blur', function(){
                                var dn = $(this).val();
                                nNum.html(dn);
                                $(this).hide();
                            }).focus();
                        }

                    });
                });
                /////////////////
                //dnProduct1
                $(".dnProduct1").each(function(index)
                {
                    $(this).dblclick(function()
                    {
                        var nNum = $(this);
                        var dnEmpty = nNum.text();
                        if(dnEmpty === "")
                        {
                            nNum.html("<input type='text' id='dnProduct" + index + "' class='form-control' placeholder='Product' />").focus();
                            $("#dnProduct" + index + "").on('blur', function(){
                                var dn = $(this).val();
                                nNum.html(dn);
                                $(this).hide();

                            }).focus();
                        }else
                        {
                            nNum.html("<input type='text' id='dnProduct" + index + "' class='form-control' placeholder='Product' value='" + dnEmpty + "'/>");
                            $("#dnProduct" + index + "").on('blur', function(){
                                var dn = $(this).val();
                                nNum.html(dn);
                                $(this).hide();
                            }).focus();
                        }
                    });
                });
                //////////////end

                //////// dnQty

                $(".dnQty1").each(function(index)
                {
                    $(this).dblclick(function()
                    {
                        var nNum = $(this);
                        var dnEmpty = nNum.text();
                        if(dnEmpty === "")
                        {
                            nNum.html("<input type='Number' id='dnQty" + index + "' class='form-control' placeholder='Quantity' />").focus();
                            $("#dnQty" + index + "").on('blur', function(){
                                var dn = $(this).val();
                                nNum.html(numeral(dn).format('0,0'));
                                $(this).hide();

                                //////////////////summarize total quantity
                                var sum1 = 0;
                                    $('.dnQty1').each(function(x, y){

                                        var mString1 = $("#dnQty1" + x + "").text().replace(/\,/g, '');
                                        if(mString1 !== "")
                                        {

                                            sum1 += parseFloat(mString1);
                                        }else
                                            return;
                                    });
                                    $("#grandQTY").html(numeral(sum1).format('0,0')).css({"font-weight": "280", "font-size": "150%"});

                                ////////////////////
                                ////////Unit Amount
                                $(".dnAmt1").each(function(index)
                                {
                                    $(this).dblclick(function()
                                    {
                                        var nNum = $(this);
                                        var dnEmpty = nNum.text();
                                        if(dnEmpty === "")
                                        {
                                            nNum.html("<input type='Number' id='dnAmt" + index + "' class='form-control' placeholder='Amount' />").focus();
                                            $("#dnAmt" + index + "").on('blur', function(){
                                                var dn0 = $(this).val();
                                                nNum.html(numeral(dn0).format('0,0.00'));

                                                $(this).hide();
                                                $("#dnTAmt" + index + "").html(numeral(dn0 * dn).format('0,0.00'));
                                                var sum = 0;
                                                $('.dnTAmt1').each(function(x, y){

                                                    var mString = $("#dnTAmt" + x + "").text().replace(/\,/g, '');
                                                    if(mString !== "")
                                                    {

                                                        sum += parseFloat(mString);
                                                    }else
                                                        return;
                                                });
                                                $("#grandTn").html(numeral(sum).format('0,0.00')).css({"font-weight": "300", "font-size": "150%"});
                                                var string = chunk(sum)
                                                        .map(inEnglish)
                                                        .map(appendScale)
                                                        .filter(isTruthy)
                                                        .reverse()
                                                        .join(" ");
                                                $("#amtWords").html(string).css({"background-color": "yellow", "font-size": "150%", "text-transform": "capitalize"});
                                            }).focus();
                                        }else
                                        {
                                            nNum.html("<input type='Number' id='dnAmt" + index + "' class='form-control' placeholder='Amount' value='" + dnEmpty + "'/>");
                                            $("#dnAmt" + index + "").on('blur', function(){
                                                var dn0 = $(this).val();
                                                nNum.html(numeral(dn0).format('0,0.00'));
                                                $(this).hide();
                                                $("#dnTAmt" + index + "").html(numeral(dn0 * dn).format('0,0.00'));
                                                var sum = 0;
                                                $('.dnTAmt1').each(function(x, y){

                                                    var mString = $("#dnTAmt" + x + "").text().replace(/\,/g, '');
                                                    if(mString !== "")
                                                    {

                                                        sum += parseFloat(mString);
                                                    }else
                                                        return;
                                                });
                                                $("#grandTn").html(numeral(sum).format('0,0.00')).css({"font-weight": "300", "font-size": "150%"});
                                                var string = chunk(sum)
                                                        .map(inEnglish)
                                                        .map(appendScale)
                                                        .filter(isTruthy)
                                                        .reverse()
                                                        .join(" ");
                                                $("#amtWords").html(string).css({"background-color": "yellow", "font-size": "150%", "text-transform": "capitalize"});

                                            }).focus();
                                        }
                                    });
                                });
                                ///////////

                            }).focus();


                        }else
                        {
                            nNum.html("<input type='Number' id='dnQty" + index + "' class='form-control' placeholder='Quantity' value='" + dnEmpty + "'/>");
                            $("#dnQty" + index + "").on('blur', function(){
                                var dn = $(this).val();
                                nNum.html(numeral(dn).format('0,0'));
                                $(this).hide();
                                //////////////////summarize total quantity
                                var sum1 = 0;
                                    $('.dnQty1').each(function(x, y){

                                        var mString1 = $("#dnQty1" + x + "").text().replace(/\,/g, '');
                                        if(mString1 !== "")
                                        {

                                            sum1 += parseFloat(mString1);
                                        }else
                                            return;
                                    });
                                    $("#grandQTY").html(numeral(sum1).format('0,0')).css({"font-weight": "280", "font-size": "150%"});

                                ////////////////////

                                ////////Unit Amount
                                $(".dnAmt1").each(function(index)
                                {
                                    $(this).dblclick(function()
                                    {
                                        var nNum = $(this);
                                        var dnEmpty = nNum.text();
                                        if(dnEmpty === "")
                                        {
                                            nNum.html("<input type='Number' id='dnAmt" + index + "' class='form-control' placeholder='Amount' />").focus();
                                            $("#dnAmt" + index + "").on('blur', function(){
                                                var dn0 = $(this).val();
                                                nNum.html(numeral(dn0).format('0,0.00'));

                                                $(this).hide();
                                                $("#dnTAmt" + index + "").html(numeral(dn0 * dn).format('0,0.00'));
                                                var sum = 0;
                                                $('.dnTAmt1').each(function(x, y){

                                                    var mString = $("#dnTAmt" + x + "").text().replace(/\,/g, '');
                                                    if(mString !== "")
                                                    {

                                                        sum += parseFloat(mString);
                                                    }else
                                                        return;
                                                });
                                                $("#grandTn").html(numeral(sum).format('0,0.00')).css({"font-weight": "300", "font-size": "150%"});
                                                var string = chunk(sum)
                                                        .map(inEnglish)
                                                        .map(appendScale)
                                                        .filter(isTruthy)
                                                        .reverse()
                                                        .join(" ");
                                                $("#amtWords").html(string).css({"background-color": "yellow", "font-size": "150%", "text-transform": "capitalize"});


                                            }).focus();
                                        }else
                                        {
                                            nNum.html("<input type='Number' id='dnAmt" + index + "' class='form-control' placeholder='Amount' value='" + dnEmpty + "'/>");
                                            $("#dnAmt" + index + "").on('blur', function(){
                                                var dn0 = $(this).val();
                                                nNum.html(numeral(dn0).format('0,0.00'));
                                                $(this).hide();
                                                $("#dnTAmt" + index + "").html(numeral(dn0 * dn).format('0,0.00'));
                                                var sum = 0;
                                                $('.dnTAmt1').each(function(x, y){

                                                    var mString = $("#dnTAmt" + x + "").text().replace(/\,/g, '');
                                                    if(mString !== "")
                                                    {

                                                        sum += parseFloat(mString);
                                                    }else
                                                        return;
                                                });
                                                $("#grandTn").html(numeral(sum).format('0,0.00')).css({"font-weight": "300", "font-size": "150%"});
                                                var string = chunk(sum)
                                                        .map(inEnglish)
                                                        .map(appendScale)
                                                        .filter(isTruthy)
                                                        .reverse()
                                                        .join(" ");
                                                $("#amtWords").html(string).css({"background-color": "yellow", "font-size": "150%", "text-transform": "capitalize"});

                                            }).focus();
                                        }
                                    });
                                });
                                ///////////
                            }).focus();
                        }
                    });
                });
                ///////////

                ////////////////converting numbers to words
                var ONE_TO_NINETEEN = [
                    "one", "two", "three", "four", "five",
                    "six", "seven", "eight", "nine", "ten",
                    "eleven", "twelve", "thirteen", "fourteen", "fifteen",
                    "sixteen", "seventeen", "eighteen", "nineteen"
                ];

                var TENS = [
                    "ten", "twenty", "thirty", "forty", "fifty",
                    "sixty", "seventy", "eighty", "ninety"
                ];

                var SCALES = ["thousand", "million", "billion", "trillion"];

// helper function for use with Array.filter
                function isTruthy(item){
                    return !!item;
                }

// convert a number into "chunks" of 0-999
                function chunk(number){
                    var thousands = [];

                    while(number > 0){
                        thousands.push(number % 1000);
                        number = Math.floor(number / 1000);
                    }

                    return thousands;
                }

// translate a number from 1-999 into English
                function inEnglish(number){
                    var thousands, hundreds, tens, ones, words = [];

                    if(number < 20){
                        return ONE_TO_NINETEEN[number - 1]; // may be undefined
                    }

                    if(number < 100){
                        ones = number % 10;
                        tens = number / 10 | 0; // equivalent to Math.floor(number / 10)

                        words.push(TENS[tens - 1]);
                        words.push(inEnglish(ones));

                        return words.filter(isTruthy).join("-");
                    }

                    hundreds = number / 100 | 0;
                    words.push(inEnglish(hundreds));
                    words.push("hundred");
                    words.push(inEnglish(number % 100));

                    return words.filter(isTruthy).join(" ");
                }

// append the word for a scale. Made for use with Array.map
                function appendScale(chunk, exp){
                    var scale;
                    if(!chunk){
                        return null;
                    }
                    scale = SCALES[exp - 1];
                    return [chunk, scale].filter(isTruthy).join(" ");
                }
//////////////////////end of conversion of numbers to words

///////////////////Posting of invoice slip to the database and printing

                $("#postInvoice").on('click', function(event){
                    $(this).hide();
                    $("#showDatabase").hide();
                    $("#rePrtInvoice").hide();
                    $('#reGenInvoice').hide();

                    window.print();
                    event.stopPropagation();
                    event.stopImmediatePropagation();

                    var eastern_teritory = $('#eastern_teritory').val();
                    var vendor_mgr = $('#vendor_mgr').val();
                    var plant_code = $('#plant_code').val();
                    var invoice_n = $('#invoice_n').text().replace(/\,/g, '');
                    var acct_code = $('#acct_code').val();
                    var frompicker = $('#frompicker').val();
                    var topicker = $('#topicker').val();

                    $(function(){
                        $('#invoice_review tr').each(function(a, b){
                            if(a !== 0)
                            {

                                var dnNum = $('.dnNumber1', b).text().replace(/\,/g, '');
                                var daten = $('.dnDate1', b).text().replace(/\,/g, '');
                                var prod_name = $('.dnProduct1', b).text().replace(/\,/g, '');
                                var r_qty = $('.dnQty1', b).text().replace(/\,/g, '');
                                var u_cost = $('.dnAmt1', b).text().replace(/\,/g, '');
                                var t_cost = $('.dnTAmt1', b).text().replace(/\,/g, '');
                                if(prod_name !== "")
                                {

                                    $.ajax({
                                        url: 'post_invoice',
                                        type: 'POST',
                                        data: {invoice_n: invoice_n, eastern_teritory: eastern_teritory, vendor_mgr: vendor_mgr,
                                            plant_code: plant_code, acct_code: acct_code, frompicker: frompicker,
                                            topicker: topicker, dnNum: dnNum, daten: daten, prod_name: prod_name, r_qty: r_qty,
                                            u_cost: u_cost, t_cost: t_cost},
                                        cache: false,
                                        success: function(data){
                                            if(data === "The invoice slip was posted successful")
                                            {
                                                window.location.reload(true);
                                            }

                                        },
                                        error: function(xhr, status, error){

                                        }
                                    });

                                }else
                                {
                                    alert("product name!");
                                    $("#postInvoice").show();
                                    $("#showDatabase").show();
                                    $("#rePrtInvoice").show();
                                    $('#reGenInvoice').show();
                                    return false;
                                }



                            }

                        });

                        //$('#sales_review').find('.tcst5').remove();

                        /*  $('#Save_result').on('click', function()
                         {
                         var mode = 'iframe'; // popup
                         var close = mode === "popup";
                         var options = {mode: mode, popClose: close};
                         $("div.content_print").printArea(options);
                         /// $.iaoAlert({msg: "The order have been successfully purchased. Thanks for your patronage!",
                         // type: "error", position: 'bottom-right', closeOnClick: true, alertTime: "8000", mode: "dark"});
                         });*/

                    });

                });

                ///////////////////Posting of invoice slip to the database and printing ending

                /////////////////////Reprint invoice slip
                $("#rePrtInvoice").on('click', function(event){
                    event.stopPropagation();
                    event.stopImmediatePropagation();

                    $('#reGenInvoice').show().css({"width": "300"});

                    $('#reGenInvoice').on('keydown', function(ev){
                        if(ev.keyCode === 13){ //only on enter keypress (code 13)
                            var invoiceN = $(this).val();
                            $.ajax({
                                url: 'get_invoice',
                                type: 'POST',
                                data: {invoiceN: invoiceN},
                                cache: false,
                                success: function(data){
                                    var eastern_teritory = data.aaData[0].eastern_teritory;
                                    var vendor_mgr = data.aaData[0].vendor_mgr;
                                    var invoice_n = data.aaData[0].invoice_n;

                                    var frompicker = data.aaData[0].frompicker;
                                    var topicker = data.aaData[0].topicker;
                                    var acct_code = data.aaData[0].acct_code;
                                    var plant_code = data.aaData[0].plant_code;
                                    $('#eastern_teritory').val(eastern_teritory);
                                    $('#vendor_mgr').val(vendor_mgr);
                                    $('#invoice_n').html(invoice_n);
                                    $('#frompicker').val(frompicker);
                                    $('#topicker').val(topicker);
                                    $('#acct_code').val(acct_code);
                                    $('#plant_code').val(plant_code);

                                    var sum = 0;
                                    var sum1 = 0;
                                    //var stn1 = numeral(data.aaData[i].r_qty).format('0,0');
                                    for(var i = 0; i < data.aaData.length; i++){
                                        $("#dnNumber1"+i+"").html(data.aaData[i].dnNum);
                                        $("#dnDate1"+i+"").html(data.aaData[i].daten);
                                        $("#dnProduct1"+i+"").html(data.aaData[i].prod_name);
                                        $("#dnQty1"+i+"").html(numeral(data.aaData[i].r_qty).format('0,0'));
                                       // $("#dnAmt1"+i+"").html(numeral(data.aaData[i].u_cost).format('0,0.00'));
                                       // $("#dnTAmt"+i+"").html(numeral(data.aaData[i].t_cost).format('0,0.00'));

                                         sum += parseFloat(data.aaData[i].t_cost);
                                         sum1 += parseFloat(data.aaData[i].r_qty);
                                    }
                                   // $("#grandTn").html(numeral(sum).format('0,0.00')).css({"font-weight": "300", "font-size": "150%"});
                                    $("#grandQTY").html(numeral(sum1).format('0,0')).css({"font-weight": "300", "font-size": "150%"});
                                    var string = chunk(sum)
                                                        .map(inEnglish)
                                                        .map(appendScale)
                                                        .filter(isTruthy)
                                                        .reverse()
                                                        .join(" ");
                                                //$("#amtWords").html(string).css({"background-color": "yellow", "font-size": "150%", "text-transform": "capitalize"});
                                    $("#postInvoice").hide();
                                    $("#showDatabase").hide();
                                    $("#rePrtInvoice").hide();
                                    $('#reGenInvoice').hide();
                                    window.print();
                                    window.location.reload(true);
                                },
                                error: function(xhr, status, error){

                                }
                            });


                        }
                    });



                });
                /////////////////////ending of Reprint invoice slip
            });
        </script>
    </body>
</html>
