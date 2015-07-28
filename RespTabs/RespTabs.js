
function rt_init__unit(l__css_class, c__css_class, rt__css_class, act__css_class) {

  $('.' + l__css_class).attr('class', 'resp-tabs-list');
  $('.' + c__css_class).attr('class', 'resp-tabs-container');

  jQuery("." + rt__css_class).easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion           
            width: 'auto', //auto or any width like 600px
            fit: true,   // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            },

            forceTab: ('.' + act__css_class)
        });
}
