var dialog = document.querySelector('dialog');
dialogPolyfill.registerDialog(dialog);
// Now dialog acts like a native <dialog>.
dialog.showModal();
