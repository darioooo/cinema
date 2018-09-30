$(".datainizio,.datafine").change(function () {
    if ($(classToModify + ".datainizio").val() && $(classToModify + ".datafine").val()) {
        var datainizio = $(classToModify + ".datainizio").datepicker({
            dateFormat: "yyyy-mm-dd"
        }).val();
        var datafine = $(classToModify + ".datafine").datepicker({
            dateFormat: "yyyy-mm-dd"
        }).val();

        myDateInizio = datainizio.split("-");
        var newDatei = myDateInizio[1] + "," + myDateInizio[2] + "," + myDateInizio[0];

        var newDataInizio = new Date(newDatei).getTime();
        var todaysDate = new Date();
        todaysDate.setHours(0, 0, 0, 0);

        myDateFine = datafine.split("/");
        var newDatef = myDateFine[1] + "," + myDateFine[2] + "," + myDateFine[0];
        var newDataFine = new Date(newDatef).getTime();

        if (newDataInizio >= todaysDate) {
            $(classToModify + ".datainizio").removeClass("fielderror");

            if (newDataInizio > newDataFine) {
                $(classToModify + ".datainizio").addClass("fielderror");
                $(classToModify + ".datafine").addClass("fielderror");
                $(classToModify + ".datafine").blur();
                $("#myModal").modal();
            } else {
                arrayOrari = new Array();
                $(classToModify + ".datainizio").removeClass("fielderror");
                $(classToModify + ".datafine").removeClass("fielderror");
                $("#orariM").empty();
                var day;
                for (var d = new Date(newDatei); d <= new Date(newDatef); d.setDate(d.getDate() + 1)) {
                    switch (d.getDay()) {
                        case 0:
                            day = "Lunedi";
                            break;
                        case 1:
                            day = "Martedi";
                            break;
                        case 2:
                            day = "Mercoledi";
                            break;
                        case 3:
                            day = "Giovedi";
                            break;
                        case 4:
                            day = "Venerdi";
                            break;
                        case 5:
                            day = "Sabato";
                            break;
                        case 6:
                            day = "Domenica";
                    }
                    var mese = d.getMonth() + 1;
                    arrayOrari.push(d.getDate().toString() + mese.toString() + d.getFullYear().toString());
                    $("#orariM").append("<div class=\"row \"><div id=\"divData" + d.getDate() + mese + d.getFullYear() +
                        "\" class=\"col-md-3 orario\"><p day=\"" + day + "\" date=\"" + d.getDate() + "\" mounth=\"" + mese +
                        "\" year=\"" + d.getFullYear() + "\">" + day + " " + d.getDate() + "/" + mese + "/" + d.getFullYear() +
                        "</p></div><div class=\"col-md-1\"><a class=\"glyphicon glyphicon-plus-sign spanAdd \"></a></div><div class=\"col-md-8 orariDiv \"></div></div></br>"
                    );
                }

                // count = count(arrayOrari);
                $("#orarimodal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
            }
        } else {
            $("#datainizio").addClass("fielderror");
            $("#todaysDateModal").modal();
        }
    }
});