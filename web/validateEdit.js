function checkVal() {
    resetErrors();
    var error = "true";
                
    if (valFName($('#fName').val()) == false) {
        $('#fNReq').css('color', 'red');
        $('#fName').addClass("error");
        $('#fBox').text("First name must contain atleast 2 characters");
        error = "false";
    }

    if (valFName($('#lName').val()) == false) {
        $('#lNReq').css('color', 'red');
        $('#lName').addClass("error");
        $('#lBox').text("Last name must contain atleast 2 characters");
        error = "false";
    }

    if (valDOB($('#dOB').val()) == false) {
        $('#dOBReq').css('color', 'red');
        $('#dOB').addClass("error");
        $('#dBox').text("Date Of Birth must be a valid date and you have to be at least 18 years old");
        error = "false";
    }

    if (valEmail($('#email').val()) == false) {
        $('#eReq').css('color', 'red');
        $('#email').addClass("error");
        $('#eBox').text("Email must be a valid Email");
        error = "false";
    }

    if (error != "false") {
        return true;
    } else {
        return false;
    }
}

function valFName(fName) {
    return fName.length > 1;
}

function valLName(lName) {
    return lName.length > 1;
}

function valDOB(dOB) {
    var validFormat = /^\d{4}\-\d{2}\-\d{2}$/;
    if (validFormat.test(dOB)) {
        var year = (new Date().getFullYear()) - 18;
        var month = new Date().getMonth();
        var date = new Date().getDate();
        var dOBY = dOB.substring(0, 4);
        var dOBM = dOB.substring(5, 7) - 1;
        var dOBD = dOB.substring(8, 10);

        if (dOBY > year) {
            return false;
        } else if (dOBY == year) {
            if (dOBM > month) {
                return false;
            } else if (dOBM == month) {
                if (dOBD > date) {
                    return false;
                }
            }
        }
    }
    return true;
}

function valEmail(mail) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    return emailReg.test(mail);
}

function resetErrors() {
    if ($('#fName').hasClass("error")) {
        $('#fName').removeClass("error");
        $(fNReq).css('color', 'black');
    }

    if ($('#lName').hasClass("error")) {
        $('#lName').removeClass("error");
        $(lNReq).css('color', 'black');
    }

    if ($('#dOB').hasClass("error")) {
        $('#dOB').removeClass("error");
        $(dOBReq).css('color', 'black');
    }

    if ($('#email').hasClass("error")) {
        $('#email').removeClass("error");
        $(eReq).css('color', 'black');
    }
}