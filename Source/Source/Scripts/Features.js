var isUpdate = false;
var id = 0;

    function getValueFromModal() {
        let modalItems = $("#info-modal").find("input,textarea,select.form-control");
        //Parse value to json
        let params = {};
        for (let i = 0; i < modalItems.length; i++) {
            if (modalItems[i].id != "") {
                if (modalItems[i].type == "file") {
                    continue;
                }
                let res = checkValid(modalItems[i]);
                if (res.valid) {
                    params[modalItems[i].id] = modalItems[i].value.trim().replace(/\n/g, "\\n");
                } else {
                    toastr.error(res.message);
                    return false;

                }
            }
        }
        return params;
    }
    function checkValid(item) {
        if (item.classList.contains('required') && item.value.trim() == '') {
            $(`#${item.id}`).focus();
            return { valid: false, message: 'Vui lòng nhập đủ các ô có dấu *' };
        }
        return { valid: true};
    }
    function setIDForDelete(code,url) {
        id = code;
        if (url) {
            path = url;
        }
    }

    function Delete(){
        $.ajax({
            url: url_Delete, // tb table
            type: "post",
            data: {
                ID:id
            },
        }).done(function (result) {
            alertMess(result);
        });
    }


    function changePage(pageNumber) {
        $.ajax({
            url: url_GetTb, // tb table
            type: "post",
            data: {
                pageNumber: pageNumber,
                pageSize: parseInt($("#pageSize").val()),
                keyText:$("#txtSearch").val()
            },
        }).done(function (result) {
            $('.data-table').html(result);
        });
    }

    function setValueForModal(ele, state) {
        isUpdate = state;
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
    
    function insertOrUpdate(obj) {
            $.ajax({
                url: url_InsertUpdate, // Md modal
                type: "post",
                data: {
                    obj: obj,
                    isUpdate: isUpdate
                },
            }).done(function (result) {
                alertMess(result);
            });
    }

    function saveChanges() {
        const obj = getValueFromModal();
        if (obj) {
            insertOrUpdate(obj);
        }
    }
    
    function alertMess(result) {
        if (result.Data.Code == 0) {
            $("#info-modal").modal("hide");
            $("#confirm-modal").modal("hide");
            toastr.success(result.Data.Message);
            changePage(1);
        } else {
            toastr.error(result.Data.Message);
        }
    }
    
