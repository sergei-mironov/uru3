structure B = Bootstrap

style starter_template
style theme_showcase

fun main {} : transaction page =
  Uru.run (
  JQuery.add (
  Bootstrap.add (
  Uru.withHeader (
    <xml>
      <title>B1 Demo</title>
      <link rel="stylesheet" href={B2_css.geturl}/>
      {Script.insert Uru.javascript Holder_js.geturl}
    </xml>) (
  Uru.withBody (fn _ => let
    x<-fresh;
    return
      <xml>
        <div class={cls (B.navbar :: B.navbar_inverse :: B.navbar_fixed_top :: [])} role="navigation">
          <div class={B.container}>
            <div class={B.navbar_header}>
              <a class={B.navbar_brand} link={main {}}>Bootstrap theme</a>
            </div>
            <div class={cls (B.collapse :: B.navbar_collapse :: [])}>
              <ul class={cls (B.nav :: B.navbar_nav :: [])}>
                <li class={B.active}><a link={main {}}>Home</a></li>
                <li><a link={main {}}>About</a></li>
                <li><a link={main {}}>Contact</a></li>
                <li class={B.dropdown}>
                  <a link={main {}} class={B.dropdown_toggle} data={data "toggle" "dropdown"}>
                    Dropdown <span class={B.caret}></span>
                  </a>
                  <ul class={B.dropdown_menu} role="menu">
                    <li><a link={main {}}>Action</a></li>
                    <li><a link={main {}}>Another action</a></li>
                    <li><a link={main {}}>Something else here</a></li>
                    <li class={B.divider}></li>
                    <li class={B.dropdown_header}>Nav header</li>
                    <li><a link={main {}}>Separated link</a></li>
                    <li><a link={main {}}>One more separated link</a></li>
                  </ul>
                </li>
              </ul>
            </div>
            <a href={bless "https://github.com/grwlf/uru3"}>
              <img style="position:absolute; top:0; right:0; border:0;" src={bless "https://camo.githubusercontent.com/365986a132ccd6a44c23a9169022c0b5c890c387/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f7265645f6161303030302e706e67"} alt="Fork me on GitHub" data={data "canonical-src" "https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png"}/>
            </a>
          </div>
        </div>
        
        <div class={cls (B.container :: theme_showcase :: [])} role="main">

          <div class={B.jumbotron}>
            <h1>Hello, UrWeb!</h1>
            <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three 
               supporting pieces of content. Use it as a starting point to create something more unique.</p>
            <p><a link={main {}} class={cls (B.btn :: B.btn_primary :: B.btn_lg :: [])} role="button">
                Learn more &raquo;
            </a></p>
          </div>
          

          <div class={B.page_header}>
            <h1>Buttons</h1>
          </div>
            
          <p>
            {btn (B.btn_lg :: B.btn_default :: []) "Default"}
            {btn (B.btn_lg :: B.btn_primary :: []) "Primary"}
            {btn (B.btn_lg :: B.btn_success :: []) "Success"}
            {btn (B.btn_lg :: B.btn_info :: []) "Info"}
            {btn (B.btn_lg :: B.btn_warning :: []) "Warning"}
            {btn (B.btn_lg :: B.btn_danger :: []) "Danger"}
            {btn (B.btn_lg :: B.btn_link :: []) "Link"}
          </p>
          <p>
            {btn (B.btn_default :: []) "Default"}
            {btn (B.btn_primary :: []) "Primary"}
            {btn (B.btn_success :: []) "Success"}
            {btn (B.btn_info :: []) "Info"}
            {btn (B.btn_warning :: []) "Warning"}
            {btn (B.btn_danger :: []) "Danger"}
            {btn (B.btn_link :: []) "Link"}
          </p>
          <p>
            {btn (B.btn_sm :: B.btn_default :: []) "Default"}
            {btn (B.btn_sm :: B.btn_primary :: []) "Primary"}
            {btn (B.btn_sm :: B.btn_success :: []) "Success"}
            {btn (B.btn_sm :: B.btn_info :: []) "Info"}
            {btn (B.btn_sm :: B.btn_warning :: []) "Warning"}
            {btn (B.btn_sm :: B.btn_danger :: []) "Danger"}
            {btn (B.btn_sm :: B.btn_link :: []) "Link"}
          </p>
          <p>
            {btn (B.btn_xs :: B.btn_default :: []) "Default"}
            {btn (B.btn_xs :: B.btn_primary :: []) "Primary"}
            {btn (B.btn_xs :: B.btn_success :: []) "Success"}
            {btn (B.btn_xs :: B.btn_info :: []) "Info"}
            {btn (B.btn_xs :: B.btn_warning :: []) "Warning"}
            {btn (B.btn_xs :: B.btn_danger :: []) "Danger"}
            {btn (B.btn_xs :: B.btn_link :: []) "Link"}
          </p>

          <div class={B.page_header}>
            <h1>Thumbnails</h1>
          </div>
          <img data={data "src" "holder.js/200x200"} class={B.img_thumbnail} alt="A generic square placeholder image with a white border around it, making it resemble a photograph taken with an old instant camera"/>

          <div class={B.page_header}>
            <h1>Wells</h1>
          </div>
          <div class={B.well}>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam eget risus varius blandit sit amet non magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Aenean lacinia bibendum nulla sed consectetur.</p>
          </div>

          <div class={B.page_header}>
            <h1>Carousel</h1>
          </div>

          <div id={x} class={cls (B.carousel :: B.slide :: [])} data={data "ride" "carousel"}>
            <ol class={B.carousel_indicators}>
              <li data={data_attrs (data "target" ("#" ^ (show x))) (data "slide-to" "0")} class={B.active}></li>
              <li data={data_attrs (data "target" ("#" ^ (show x))) (data "slide-to" "1")}></li>
              <li data={data_attrs (data "target" ("#" ^ (show x))) (data "slide-to" "2")}></li>
            </ol>
            <div class={B.carousel_inner}>
              <div class={cls (B.item :: B.active :: [])}>
                <img data={data "src" "holder.js/1140x500/auto/#777:#555/text:First slide"} alt="First slide"/>
              </div>
              <div class={B.item}>
                <img data={data "src" "holder.js/1140x500/auto/#666:#444/text:Second slide"} alt="Second slide"/>
              </div>
              <div class={B.item}>
                <img data={data "src" "holder.js/1140x500/auto/#555:#333/text:Third slide"} alt="Third slide"/>
              </div>
            </div>
            <a style={CSS.css (("cursor",CSS.Str "pointer") :: [])} class={cls (B.left :: B.carousel_control :: [])} role="button" data={data_attrs (data "target" ("#" ^ (show x))) (data "slide" "prev")}>
              <span class={cls (B.glyphicon :: B.glyphicon_chevron_left ::[])}></span>
            </a>
            <a style={CSS.css (("cursor",CSS.Str "pointer") :: [])} class={cls (B.right :: B.carousel_control :: [])} role="button" data={data_attrs (data "target" ("#" ^ (show x))) (data "slide" "next")}>
              <span class={cls (B.glyphicon :: B.glyphicon_chevron_right ::[])}></span>
            </a>
          </div>

        </div>
      </xml>
    where
      val cls = CSS.list
      val data = data_attr data_kind
      fun btn cs txt = <xml><a class={cls (B.btn :: cs)}>{[txt]}</a></xml>
    end)))))

