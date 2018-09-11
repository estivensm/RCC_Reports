// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//require 'will_paginate/array' 
//= require jquery_ujs
//= require chosen-jquery
//= require bootstrap-multiselect
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

  (function($) {
  window.NestedFormEvents = function() {
    this.addFields = $.proxy(this.addFields, this);
    this.removeFields = $.proxy(this.removeFields, this);
  };

  NestedFormEvents.prototype = {
    addFields: function(e) {
      // Setup
      var link      = e.currentTarget;
      var assoc     = $(link).data('association');                // Name of child
      var blueprint = $('#' + $(link).data('blueprint-id'));
      var content   = blueprint.data('blueprint');                // Fields template

      // Make the context correct by replacing <parents> with the generated ID
      // of each of the parent objects
      var context = ($(link).closest('.fields').closestChild('input, textarea, select').eq(0).attr('name') || '').replace(/\[[a-z_]+\]$/, '');

      // If the parent has no inputs we need to strip off the last pair
      var current = content.match(new RegExp('\\[([a-z_]+)\\]\\[new_' + assoc + '\\]'));
      if (current) {
        context = context.replace(new RegExp('\\[' + current[1] + '\\]\\[(new_)?\\d+\\]$'), '');
      }

      // context will be something like this for a brand new form:
      // project[tasks_attributes][1255929127459][assignments_attributes][1255929128105]
      // or for an edit form:
      // project[tasks_attributes][0][assignments_attributes][1]
      if (context) {
        var parentNames = context.match(/[a-z_]+_attributes(?=\]\[(new_)?\d+\])/g) || [];
        var parentIds   = context.match(/[0-9]+/g) || [];

        for(var i = 0; i < parentNames.length; i++) {
          if(parentIds[i]) {
            content = content.replace(
              new RegExp('(_' + parentNames[i] + ')_.+?_', 'g'),
              '$1_' + parentIds[i] + '_');

            content = content.replace(
              new RegExp('(\\[' + parentNames[i] + '\\])\\[.+?\\]', 'g'),
              '$1[' + parentIds[i] + ']');
          }
        }
      }

      // Make a unique ID for the new child
      var regexp  = new RegExp('new_' + assoc, 'g');
      var new_id  = this.newId();
      content     = $.trim(content.replace(regexp, new_id));

      var field = this.insertFields(content, assoc, link);
      // bubble up event upto document (through form)
      field
        .trigger({ type: 'nested:fieldAdded', field: field })
        .trigger({ type: 'nested:fieldAdded:' + assoc, field: field });
      return false;
    },
    newId: function() {
      return new Date().getTime();
    },
    insertFields: function(content, assoc, link) {
      var target = $(link).data('target');
      if (target) {
        return $(content).appendTo($(target));
      } else {
        return $(content).insertBefore(link);
      }
    },
    removeFields: function(e) {
      var $link = $(e.currentTarget),
          assoc = $link.data('association'); // Name of child to be removed
      
      var hiddenField = $link.prev('input[type=hidden]');
      hiddenField.val('1');
      
      var field = $link.closest('.fields');
      field.hide();
      
      field
        .trigger({ type: 'nested:fieldRemoved', field: field })
        .trigger({ type: 'nested:fieldRemoved:' + assoc, field: field });
      return false;
    }
  };

  window.nestedFormEvents = new NestedFormEvents();
  $(document)
    .delegate('form a.add_nested_fields',    'click', nestedFormEvents.addFields)
    .delegate('form a.remove_nested_fields', 'click', nestedFormEvents.removeFields);
})(jQuery);

// http://plugins.jquery.com/project/closestChild
/*
 * Copyright 2011, Tobias Lindig
 *
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *
 */
(function($) {
        $.fn.closestChild = function(selector) {
                // breadth first search for the first matched node
                if (selector && selector != '') {
                        var queue = [];
                        queue.push(this);
                        while(queue.length > 0) {
                                var node = queue.shift();
                                var children = node.children();
                                for(var i = 0; i < children.length; ++i) {
                                        var child = $(children[i]);
                                        if (child.is(selector)) {
                                                return child; //well, we found one
                                        }
                                        queue.push(child);
                                }
                        }
                }
                return $();//nothing found
        };
})(jQuery);

'turbolinks:load'
 
$(document).on('turbolinks:load',function() 

{
        
 



        

        $('.example-getting-started').multiselect(
        
        {
           buttonWidth: '100%'
        });
        
});

 $(document).on('turbolinks:load',function() {
        return $('.chosen-select').chosen(
        {

          allow_single_deselect: true,
          no_results_text: 'No results matched',
          width: '250px'
        });
});

 $(document).on('turbolinks:load',function(){
  
        $(".decitex").change(function()
        {
                $d = 0;
                $d = $(".decitex").val();
                $d= (0.9*$d).toFixed(2);

                $(".denier").val($d);
                
                });
        $(".denier").change(function()
        {
                $d = 0;
                $d = $(".denier").val();
                $d= ($d/0.9).toFixed(2);

                $(".decitex").val($d);
         });
        
          $('.code').attr("disabled", true);
          $('.country').attr("disabled", true);


        

          $(".borrar").click(function()
            {

              //$('.23').each(
                  //function() 
                  //{

                    $a =  $('.24').attr('class');
                    $.get("/delete_fields/" + $a , function(data) 
                        {
            console.log($a)

                        });

                  //});

       

            });



 $('.sh').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Product name",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });

      $('.sh1').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Customer",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });
      $('.sh2').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Plant",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });

        $('.sh4').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Merge",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });

              $('.sh5').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Yarn",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });

        $('.sh6').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Plant",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });

                $('.sh7').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Filament",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });


       

});

