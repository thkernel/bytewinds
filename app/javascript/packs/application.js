// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "stylesheets/application"

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//Default
// require rails-ujs
// require turbolinks
// require_tree .

//By me
//= require jquery
//= require rails-ujs

// require geocomplete
//= require jquery.geocomplete
//= require turbolinks
//= require lib/popper.js/umd/popper.min

//= require bootstrap-sprockets
//= require bootstrap
//= require toastr
//= require rails.validations

//= require lib/datatables.net/js/jquery.dataTables.min
//= require lib/datatables.net-dt/js/dataTables.dataTables.min
//= require lib/datatables.net-responsive/js/dataTables.responsive.min
//= require lib/datatables.net-responsive-dt/js/responsive.dataTables.min

// NEW BRACKET JS
//= require lib/jquery-ui/ui/widgets/datepicker
//= require lib/bootstrap/js/bootstrap.bundle.min
//= require lib/perfect-scrollbar/perfect-scrollbar.min
//= require lib/moment/min/moment.min
//= require lib/peity/jquery.peity.min
//= require lib/rickshaw/vendor/d3.min
//= require lib/rickshaw/vendor/d3.layout.min
//= require lib/rickshaw/rickshaw.min
//= require lib/jquery.flot/jquery.flot
//= require lib/jquery.flot/jquery.flot.resize
//= require lib/flot-spline/js/jquery.flot.spline.min
// require lib/jquery-sparkline/jquery.sparkline.min
// require lib/echarts/echarts.min
//= require lib/select2/js/select2.full.min

//= require js/bracket
//= require js/ResizeSensor
//= require js/dashboard

//= require google_analytics
// require cookies_eu
// require jquery.uploadPreview.min
//= require signup
//= require cocoon
//= require social-share-button

//= require invitations
// require webcam-easy.min
// require start-webcam

// For Geocomplete
$(document).on('turbolinks:load', function(){
	$("#autocomplete_address").geocomplete();  // Option 1: Call on element.
	
});








$(document).on('turbolinks:load', function() {
      $('#datatable1').DataTable({
        
        "searching": true,
        "ordering": true,
        language: {
            processing: "Traitement en cours...",
            search: "Rechercher&nbsp;:",
            lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
            info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
            infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
            infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
            infoPostFix: "",
            loadingRecords: "Chargement en cours...",
            zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
            emptyTable: "Aucune donnée disponible dans le tableau",
            paginate: {
                first: "Premier",
                previous: "Pr&eacute;c&eacute;dent",
                next: "Suivant",
                last: "Dernier"
            },
            aria: {
                sortAscending: ": activer pour trier la colonne par ordre croissant",
                sortDescending: ": activer pour trier la colonne par ordre décroissant"
            }
        },
        responsive: false,
        dom: 'Bfrtip',
        buttons: [
            { extend: 'copyHtml5', footer: true },
            { extend: 'csvHtml5', footer: true },
            { extend: 'pdfHtml5', footer: true }
        ]
          });
  });

 

$(document).on('turbolinks:load', function() {
  $('body').on('shown.bs.modal', '.modal', function() {
    $(this).find('.customSelect select').each(function() {
      var dropdownParent = $(document.body);
      if ($(this).parents('.modal.in:first').length !== 0)
        dropdownParent = $(this).parents('.modal.in:first');
      $(this).select2({
        dropdownParent: dropdownParent,
        width: 'resolve' ,
      });
    });
  });
});

$(document).on('turbolinks:load', function() {  

  $(this).find('.customSelect select').each(function() {
    var dropdownParent = $(document.body);

      $(this).select2({
        dropdownParent: dropdownParent,
        width: 'resolve' ,
      });
  });

});




  $(document).on('turbolinks:load', function() {  
    var width = $('.g-recaptcha').parent().width();
    if (width < 302) {
      var scale = width / 302;
      $('.g-recaptcha').css('transform', 'scale(' + scale + ')');
      $('.g-recaptcha').css('-webkit-transform', 'scale(' + scale + ')');
      $('.g-recaptcha').css('transform-origin', '0 0');
      $('.g-recaptcha').css('-webkit-transform-origin', '0 0');
    }

});


  function ajaxFilterByID(source, route, verb){
  console.log("Source: ", source);
  $(source).on("change", function() {
      $.ajax({
          type: verb,
          headers: {
              'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
              },
          dataType: 'script',
          url: route,
          data: { id: $(source + ' option:selected').val()}
      });
  });
};