/* Wrappers for Persona functions */
function request() {
  navigator.id.request();
}

function logout() {
  navigator.id.logout();
}

function watch(user, signin, signout) {
  navigator.id.watch( {
    loggedInUser: user,
    onlogin: function(x) { execF(execF(signin, x)); },
    onlogout: function() { execF(execF(signout)); }
  });
}

