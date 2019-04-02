    function getValueFromModal() {
        let modalItems = $("#info-modal").find("input,textarea,select.form-control");
        let myself = this;
        //Parse value to json
        let params = "{";
        for (let i = 0; i < modalItems.length; i++) {
            if (modalItems[i].id != "") {
                if (modalItems[i].type == "checkbox") {
                    //params += myself.getCheckBoxValue(modalItems[i]);
                    continue;
                }
                //let res = myself.checkValid(modalItems[i]);
                //if (res.valid) {
                    params += "\"" + modalItems[i].id + "\": \"" + modalItems[i].value.replace(/\n/g, "") + "\",";
                /*} else {
                    toastr.error(res.message);
                    return false;

                }*/
            }
        }
        params = params.substring(0, params.length - 1);
        params += "}";
        params = JSON.parse(params);
        return params;
    }

    function changePage(pageNumber) {
        $.ajax({
            url: url_GetTb, // tb table
            type: "post",
            data: {
                pageNumber: pageNumber,
                pageSize:10,
                keyText:''
            },
        }).done(function (result) {
            $('.data-table').html(result);
        });
    }

    function setValueForModal(ele) {
        $.ajax({
            url: url_GetMd, // Md modal
            type: "post",
            data: {
                ID: parseInt(ele.getAttribute("data-id"))
            },
        }).done(function (result) {
            $('#info-modal .modal-body').html(result);
        });
    }


    function saveChanges(ele) {
        $.ajax({
            url: url_InsertUpdate, // Md modal
            type: "post",
            data: {
                obj: getValueFromModal(),
                isUpdate:ele.getAttribute("data-update")
            },
        }).done(function (result) {
            alertMess(result);

        });
    }
    
    function alertMess(result) {
        if (result.Data.Code == 0) {
            $("#info-modal").modal("hide");
            toastr.success(result.Data.Message);
            changePage(1);
        } else {
            toastr.error(result.Data.Message);
        }
    }


