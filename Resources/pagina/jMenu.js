var menu = function () {
    var currentMenu = '';
    var currentPage = '';
    var menuClear = function () {
        $(".menu").removeClass("active");

    }
    var menuActivate = function () {
        menuClear();
        $("#" + currentMenu).addClass("active");
        $("#" + currentMenu).addClass("open")
        $("#" + currentMenu + " ul").attr("Style", "display: block;");
        $("#" + currentMenu + " .arrow").addClass("open")

        if (currentPage.length != 0) {
            $("#" + currentPage).addClass("current");
        }
    }
    return {
        init: function () {
            menuClear();
            $("#" + currentMenu).addClass("active");
            $("#" + currentMenu).addClass("open")
            $("#" + currentMenu + " ul").attr("Style", "display: block;");
            $("#" + currentMenu + " .arrow").addClass("open")

            if (currentPage.length != 0) {
                $("#" + currentPage).addClass("current");
            }
        },
        setPage: function (NameMenu,namePage) {
            currentPage = namePage;
            currentMenu = NameMenu;
            menuActivate();
        },
        isPage: function (name) {
            return currentPage == name ? true : false;
        },
        namePage: function () {
            return currentPage;
        }
    };
} ();