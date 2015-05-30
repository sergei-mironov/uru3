

function enable_tooltips__unit(unit) {
  $('[data-toggle="tooltip"]').tooltip({'placement': 'top'});
}

function popover__unit(id__string, text__string) {
  $(id__string).popover({'show':true, 'title' : text__string, 'placement' : 'top'});
  $(id__string).popover('show');
}

function tooltip__unit(id__string, text__xbody) {
  $(id__string).tooltip({'show':true, 'title' : text__xbody});
  $(id__string).tooltip('show');
}
