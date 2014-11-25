structure B = Bootstrap

fun main {} : transaction page =
  Uru.run (
  JQuery.add (
  Bootstrap.add (
  Uru.withHeader (
    <xml>
      <title>Modal Demo</title>
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
        <div class={cl (B.container :: [])} role="main">

        <div class={cl (B.modal :: B.fade :: [])} id={x} role="dialog" data={data_attrs (aria "labelledby" (show x)) (aria "hidden" "true")}>
          <div class={B.modal_dialog}>
            <div class={B.modal_content}>
              <div class={B.modal_header}>
                <a role="button" class={B.close} data={data_attrs (data "dismiss" "modal") (aria "hidden" "true")} link={main {}}>times</a>
                <h4 class={B.modal_title}>Modal title</h4>
              </div>
              <div class={B.modal_body}>
                <h3>Modal Body</h3>
              </div>
              <div class={B.modal_footer}>
                <a role="button" class={btn_def} data={data "dismiss" "modal"} link={main {}}>Close</a>
                <a role="button" class={btn_prim} link={main {}}>Save changes</a>
              </div>
            </div>
          </div>
        </div>

        <button class={cl (B.btn :: B.btn_lg :: B.btn_success :: [])}
           data={data_attrs (data "toggle" "modal") (data "target" ("#" ^ (show x)))}>
          Click to open Modal
        </button>
        </div>
      </xml>
    end)))))

