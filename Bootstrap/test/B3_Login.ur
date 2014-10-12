structure B = Bootstrap

style form_signin
style form_signin_heading

fun main {} : transaction page =
  let
  Uru.run (
  JQuery.add (
  Bootstrap.add (
  Uru.withHeader (
    <xml>
      <title>B3 Login demo</title>
      <link rel="stylesheet" href={B3_Login_css.geturl}/>
      <link rel="stylesheet" href={FormSignin_css.geturl}/>
    </xml>) (
  Uru.withBody (fn _ =>
    return
      <xml>
        <div class={B.container}>

          <form class={form_signin} role="form">
            <h2 class={form_signin_heading}>Ur/Web sign in demo</h2>
            <email{#Email} class={B.form_control} placeholder="Email address" required="true" autofocus="true"/>
            <password{#Password} class={B.form_control} placeholder="Password" required="true"/>
            <label class={B.checkbox}>
              <checkbox{#Remember} checked={False} value="remember-me"/>Remember me
            </label>
            <submit value="Sign in" class={CSS.list (B.btn :: B.btn_lg :: B.btn_primary :: B.btn_block :: [])} action={handler}/>
          </form>

        </div> <!-- /container -->
      </xml>
    )))))
  where
    fun handler f = redirect (url (main {}))
  end

