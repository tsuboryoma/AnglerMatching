document.addEventListener("DOMContentLoaded", function() {
  var locationSelect = document.getElementById('location-filter-form');
  if (locationSelect) {
    locationSelect.addEventListener('change', function() {
      var form = document.getElementById('location-filter-form');
      if (form) {
        form.submit();
      }
    });
  }
});