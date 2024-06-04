$(function () {
  $("#estate_form").submit(function (event) {
    event.preventDefault();

    var formValid = true;

    $("#estate_form input, #estate_form textarea, #estate_form select").each(
      function () {
        var formGroup = $(this).parents(".form-group");
        if (this.checkValidity()) {
          formGroup.addClass("has-success").removeClass("has-error");
        } else {
          formGroup.addClass("has-error").removeClass("has-success");
          formValid = false;
        }
      }
    );

    if (formValid) {
      // Отримуємо значення з форми
      var estateType = $("#estate_type").val();
      var repairType = $("#repair_type").val();
      var address = $("#address").val();
      var floor = $("#floor").val();
      var numberOfRooms = $("#number_of_rooms").val();
      var space = $("#space").val();
      var yearOfConstruction = $("#year_of_construction").val();
      var description = $("#description").val();
      var cost = $("#cost").val();

      // Отримуємо координати за допомогою Google Autocomplete
      var place = autocomplete.getPlace();
      var latitude = place.geometry.location.lat();
      var longitude = place.geometry.location.lng();

      // Об'єкт FormData
      var formData = new FormData();
      formData.append("estate_type", estateType);
      formData.append("repair_type", repairType);
      formData.append("address", address);
      formData.append("floor", floor);
      formData.append("number_of_rooms", numberOfRooms);
      formData.append("space", space);
      formData.append("year_of_construction", yearOfConstruction);
      formData.append("description", description);
      formData.append("cost", cost);
      formData.append("latitude", latitude);
      formData.append("longitude", longitude);

      // Відправка форми через AJAX
      $.ajax({
        type: "POST",
        url: "form/zapyt.php",
        data: formData,
        contentType: false,
        processData: false,
        cache: false,
        success: function (data) {
          var cleanData = data.replace(/^\uFEFF/, ""); // Видалення BOM символів
          var $data = JSON.parse(cleanData);
          if ($data.result == "success") {
            alert("Нерухомість успішно додана!");
            $("#estate_form")[0].reset();
            $("#addEstateModal").modal("hide");
            $("#estateList").load(location.href + " #estateList");
          } else {
            alert("Помилка: " + ($data.message || "Заповніть всі поля."));
          }
        },
        error: function (request) {
          alert("Помилка: " + request.responseText);
        },
      });
    }
  });
});
