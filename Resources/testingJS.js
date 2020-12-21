function revisar() {
    var id = $(e).attr("key");
    var obs = $(e).attr("obs");
    var fc = $(e).attr("fc".replace("-", "/").split(" "));
    var hr = $(e).attr("hr");
    var ns = $(e).attr("ns");
    var pc = $(e).attr("pc");
    var pv = $(e).attr("pv");
    var fh = $(e).attr("fh".replace("-", "/").split(" "));
    var cg = $(e).attr("cg");
    var sap = $(e).parent().parent().children('td').eq(0).text();
    var cod = $(e).parent().parent().children('td').eq(1).text();
    var nombre = $(e).parent().parent().children('td').eq(2).text();
    var tipo = $(e).parent().parent().children('td').eq(3).text();
}