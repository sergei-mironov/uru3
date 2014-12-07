structure B = Bootstrap

val nav = @@NavTag.nav

fun main {} : transaction page =
  Uru.run (
  JQuery.add (
  Bootstrap.add (
  Uru.withHeader (
    <xml>
      <title>Narrow Demo</title>
    </xml>) (
  Uru.withBody (fn _ =>
    let
      val cl = CSS.list
      val data = data_attr data_kind
      val aria = data_attr aria_kind

      val btn_prim = cl (B.btn :: B.btn_primary :: [])
      val btn_def = cl (B.btn :: B.btn_default :: [])
    in
      x <- fresh;
      return
      <xml>
        <div class={B.container} style="max-width:730px">

          <div style="border-bottom:1px solid #e5e5e5; margin-bottom:30px; padding-bottom:19px">
            <nav>
              <ul class={cl (B.nav :: B.nav_pills :: B.pull_right :: [])}>
                <li role="presentation" class={B.active}><a href={url (main {})}>Home</a></li>
                <li role="presentation"><a href={url (main {})}>About</a></li>
                <li role="presentation"><a href={url (main {})}>Contact</a></li>
              </ul>
            </nav>
            <h3 class={B.text_muted}>Project name</h3>
          </div>

          <div class={B.jumbotron} style="text-align:center">
            <h1>Jumbotron heading</h1>
            <p class={B.lead}>Cras justo odio, dapibus ac facilisis
            in, egestas eget quam. Fusce dapibus, tellus ac
            cursus commodo, tortor mauris condimentum nibh, ut
            fermentum massa justo sit amet risus.</p>
            <p><a class={cl (B.btn :: B.btn_lg :: B.btn_success :: [])} href={url(main {})} role="button"
                style="font-size:21px">
              Sign up today
            </a></p>
          </div>
        </div>
      </xml>
    end)))))

