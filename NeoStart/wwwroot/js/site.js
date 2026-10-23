function deleteConfirm(url) {
    Swal.fire({
        title: 'Are you sure?',
        text: 'You will not be able to undo this action!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = url;
        }
    });
}

//function showConfirmation() {

//    Swal.fire({
//        title: 'Are you sure?',
//        text: 'You are about to save your data!',
//        icon: 'warning',
//        showCancelButton: true,
//        confirmButtonText: 'Yes, save it!',
//        cancelButtonText: 'Cancel'
//    }).then((result) => {
//        if (result.isConfirmed) {
//            Swal.fire('Saved!', 'Your data has been saved successfully.', 'success').then(() => {
      
//                setTimeout(function () {
//                    window.location.href = '/Employee/Index';
                   
//                }, 1000); 
//            });
//        }
//    });

//    return false;
//}


function showConfirmation() {
    Swal.fire({
        title: 'Are you sure?',
        text: 'You are about to save your data!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, save it!',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {

            var formData = new FormData($('#EditFormId')[0]); // Ensure the correct form ID is used
            $.ajax({
                type: "POST",
                url: "/Employee/Edit", 
                data: formData,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response.success) {
                        Swal.fire('Saved!', response.message, 'success').then(() => {
                            setTimeout(function () {
                                window.location.href = '/Employee/Index'; 
                            }, 1000);
                        });
                    } else {
                        Swal.fire('Error', response.message, 'error');
                    }
                },
                error: function (xhr, status, error) {
                    Swal.fire('Error', 'An unexpected error occurred.', 'error');
                }
            });
        }
    });

    return false; 
}



function GetCountry() {
    $.ajax({
        url: "/Employee/Country",
        type: "GET",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            $.each(result, function (i, data) {
                $('#Country').append('<option value="' + data.rowId + '">' + data.countryName + '</option>');
            });
        }
    });
}

function GetState(countryId) {
    $.ajax({
        url: "/Employee/State?countryId=" + countryId,
        type: "GET",
        contentType: "application/json; charset=utf-8",
        success: function (result) {

            $.each(result, function (i, data) {
                $('#State').append('<option value="' + data.rowId + '">' + data.stateName + '</option>');
            });
        }
    });
}

function GetCity(stateId) {
    $.ajax({
        url: "/Employee/City?stateId=" + stateId,
        type: "GET",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            console.log(result);
            $.each(result, function (i, data) {
                $('#City').append('<option value="' + data.rowId + '">' + data.cityName + '</option>');
            });
        }
    });
}
