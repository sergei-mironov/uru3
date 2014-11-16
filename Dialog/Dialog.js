
function dialog_show__unit(dialog__id) {
  var dialog = document.querySelector('#' + dialog__id);
  dialogPolyfill.registerDialog(dialog);
  dialog.showModal();
}

function dialog_showModal__unit(dialog__id) {
  var dialog = document.querySelector('#' + dialog__id);
  dialogPolyfill.registerDialog(dialog);
  dialog.showModal();
}

function dialog_close__unit(dialog__id) {
  var dialog = document.querySelector('#' + dialog__id);
  dialog.close();
}
