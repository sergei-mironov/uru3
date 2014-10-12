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

          <a href={bless "https://github.com/grwlf/uru3"}>
            <img style="position:absolute; top:0; right:0; border:0;" src={bless "https://camo.githubusercontent.com/365986a132ccd6a44c23a9169022c0b5c890c387/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f7265645f6161303030302e706e67"} alt="Fork me on GitHub" data={data_attr data_kind "canonical-src" "https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png"}/>
          </a>

        </div> <!-- /container -->
      </xml>
    )))))
  where
    fun handler f = redirect (url (main {}))
  end

