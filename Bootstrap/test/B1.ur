
style starter_template

structure B = Bootstrap

fun swap a b c = a c b

val cls = CSS.list

fun myHeaders f r = 
  f (swap Uru.addHeader r
    <xml>
      <link rel="stylesheet" href={B1_css.geturl}/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
    </xml>)

fun main {} : transaction page =
  Uru.run (
  myHeaders (
  JQuery.add (
  Bootstrap.add (
  Uru.withBody (fn _ =>
    return
      <xml>

        <div class={cls (B.navbar :: B.navbar_inverse :: B.navbar_fixed_top :: [])} role="navigation">
          <div class={B.container}>
            <div class={B.navbar_header}>
              <a class={B.navbar_brand} link={main {}}>Project name</a>
            </div>
            <div class={cls (B.collapse :: B.navbar_collapse :: [])}>
              <ul class={cls (B.nav :: B.navbar_nav :: [])}>
                <li class={B.active}><a link={main {}}>Home</a></li>
                <li><a link={main {}}>About</a></li>
                <li><a link={main {}}>Contact</a></li>
              </ul>
            </div>
          </div>
        </div>

        <div class={B.container}>
          <div class={starter_template}>
            <h1>Bootstrap starter template</h1>
            <p class={B.lead}>Use this document as a way to quickly start any new project.<br/> All you get is this text and a mostly barebones HTML document.</p>
          </div>
        </div>

      </xml>
    )))))

