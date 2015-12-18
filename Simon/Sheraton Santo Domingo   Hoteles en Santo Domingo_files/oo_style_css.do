




/*
OnlineOpinion v5.7.3
Released: 6/4/2013. Compiled 06/04/2013 08:37:25 AM -0500
Branch: master 122a760d8e979af7090004b5d3cb086d5b0896be
Components: Full
The following code is Copyright 1998-2013 Opinionlab, Inc.  All rights reserved. Unauthorized use is prohibited. This product and other products of OpinionLab, Inc. are protected by U.S. Patent No. 6606581, 6421724, 6785717 B1 and other patents pending. http://www.opinionlab
*/


    
        
    
    





    




/*
TODO : There is no resorts image in CMS.
*/
















#oo_feedback_fl_spacer { display: block; height: 1px; position: absolute; top: 0; width: 100px; }

.oo_feedback_float { width: 100px; height: 50px; overflow: hidden; font: 12px Tahoma, Arial, Helvetica, sans-serif; text-align: center; color: #252525; cursor: pointer; z-index: 999997; position: fixed; bottom: 5px; border: 1px solid #cccccc; border-radius: 9px; -moz-border-radius: 9px; -webkit-border-radius: 9px; right: 10px; -webkit-transition: -webkit-transform 0.3s ease; }
.oo_feedback_float .screen_reader { color: transparent; display: block; position: relative; height: 0; width: 0; line-height: 0; overflow: hidden; }
.oo_feedback_float .olUp { width: 100%; height: 100%; background: url(/common/js/online_opinion_v5/images/oo_float_icon.gif) center 10px no-repeat; text-align: center; padding: 31px 0 5px 0; position: relative; z-index: 2; filter: alpha(opacity=100); opacity: 1; transition: opacity 0.5s; -moz-transition: opacity 0.5s; -webkit-transition: opacity 0.5s; -o-transition: opacity 0.5s; }
.oo_feedback_float .olUp img { margin-bottom: 5px; }
.oo_feedback_float .oo_transparent { display: block; background: white; position: absolute; top: 0; left: 0; height: 100%; width: 100%; z-index: 1; opacity: 0.8; filter: alpha(opacity=80); border-radius: 8px; -moz-border-radius: 8px; -webkit-border-radius: 8px; }
.oo_feedback_float:hover .oo_transparent { opacity: 1.0; filter: alpha(opacity=100); }
.oo_feedback_float:hover .olUp { display: block; opacity: 0; filter: alpha(opacity=0); }
.oo_feedback_float .fbText { display: block; }
.oo_feedback_float .olOver { display: block; height: 100%; width: 100%; position: absolute; top: 0; left: 0; min-height: 50px; z-index: 2; opacity: 0; filter: alpha(opacity=0); transition: opacity 0.5s; -moz-transition: opacity 0.5s; -webkit-transition: opacity 0.5s; -o-transition: opacity 0.5s; }
.oo_feedback_float .olOver span { display: block; padding: 10px 5px; }
.oo_feedback_float:hover .olOver { opacity: 1.0; filter: alpha(opacity=100); top: 0; }

.oo_cc_wrapper { left: 0; padding: 0; position: fixed; text-align: center; top: 25px; width: 100%; z-index: 999999; }
.oo_cc_wrapper .screen_reader { color: transparent; display: block; position: relative; height: 0; width: 0; line-height: 0; overflow: hidden; }
.oo_cc_wrapper span { width: 100%; height: 100%; position: absolute; left: 0; top: 0; z-index: 1; }
.oo_cc_wrapper .iwrapper { background-color: white; margin: 0 auto; position: relative; width: 535px; z-index: 2; box-shadow: rgba(0, 0, 0, 0.6) 0 0 15px; -webkit-box-shadow: rgba(0, 0, 0, 0.6) 0 0 15px; -moz-box-shadow: rgba(0, 0, 0, 0.6) 0 0 15px; border-radius: 9px; -moz-border-radius: 9px; -webkit-border-radius: 9px; }
.oo_cc_wrapper iframe { position: relative; border: none; width: 100%; z-index: 4; }
.oo_cc_wrapper .oo_cc_close { position: absolute; display: block; background: white; height: 20px; width: 20px; border: 1px solid #cccccc; cursor: pointer; right: -12px; top: -9px; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; transition: background 0.5s; -moz-transition: background 0.5s; -webkit-transition: background 0.5s; -o-transition: background 0.5s; font: 14px/20px Tahoma, Arial, Helvetica, sans-serif; text-align: center; z-index: 5; color: #252525; text-decoration: none; }
.oo_cc_wrapper .oo_cc_close:hover { background: #eeeeee; }

.oo_bar { padding-bottom: 22px; }

#oo_bar { cursor: pointer; color: #252525; border-top: 1px solid #cccccc; background: #ffffff; bottom: 0; display: block; font: 12px Tahoma, Arial, Helvetica, sans-serif; height: 22px; left: 0; line-height: 22px; position: fixed; text-align: left; width: 100%; z-index: 999997; -webkit-transition: -webkit-transform 0.3s ease; transition: background 0.5s; -moz-transition: background 0.5s; -webkit-transition: background 0.5s; -o-transition: background 0.5s; }
#oo_bar:hover { background: #eeeeee; }
#oo_bar .screen_reader { color: transparent; display: block; position: relative; height: 0; width: 0; line-height: 0; overflow: hidden; }
#oo_bar span { background: url(/common/js/online_opinion_v5/images/oo_bar_icon.gif) left no-repeat; display: block; margin: 0 15px; height: 100%; padding-left: 17px; }

    
        #oo_tab { background-color: #ffffff;  background-image: none; border: none; display: block; position: fixed; bottom: 8%; padding: 55px 0px 55px 0px; _height: 110px; _padding: 0px; _top: 45%; width: 35px; z-index: 999995; cursor: pointer; }
        * + HTML #oo_tab {height: 115px; padding: 0px;}
        #oo_tab span { bottom: 15px; _bottom: 5px; display: block; background: none; height: 9px; position: absolute; width: 9px; }
        #oo_tab div { background-image: url(/es_ES/Media/Graphics/Common/OpinionLab/feedback_SI.png); _background-image: none; background-repeat: no-repeat; position: absolute; display: block; height: 100%; left: 0; top: 0; width: 100%; }
        #oo_tab.wcag a { background: url(/common/js/online_opinion_v5/images/oo_tab_icon.gif) no-repeat; background-repeat: no-repeat; background-position: center bottom; border: none; outline: none; position: absolute; display: block; bottom: 15px; left: -6px; top: 0; width: 100%; }
        #oo_tab.wcag img { border: none; outline: none; display: block; position: absolute; left: 0; top: -10px; }
        #oo_tab .screen_reader { color: transparent; display: block; position: relative; height: 0; width: 0; line-height: 0; overflow: hidden; }

        .oo_tab_left { left: -13px; border-radius: 0px 9px 9px 0px; -moz-border-radius: 0px 9px 9px 0px; -webkit-border-radius: 0px 9px 9px 0px; transition: left 0.5s; -moz-transition: left 0.5s; -webkit-transition: left 0.5s; -o-transition: left 0.5s; background-image: -webkit-gradient(linear, 0% 100%, 0% 0%, from(#eeeeee), to(white)); background-image: -webkit-linear-gradient(left, #eeeeee, white); background-image: -moz-linear-gradient(left, #eeeeee, white); background-image: -ms-linear-gradient(left, #eeeeee, white); background-image: -o-linear-gradient(left, #eeeeee, white); background-image: linear-gradient(left, #eeeeee, white); }
        .oo_tab_left span { right: 6px; }
        .oo_tab_left div { background-position: 6px -10px; }
        .oo_tab_left:hover { left: -5px; }

        .oo_tab_right { right: -10px;}
        .oo_tab_right span { left: 7px; }
        .oo_tab_right div { background-position: -6px -10px; background: url(/es_ES/Media/Graphics/Common/OpinionLab/feedback_SI.png)  }
        .oo_tab_right:hover { right: -5px; }

        .oo_tab_ie_right { border-right: none !important; right: 1px; width: 25px !important; }
        .oo_tab_ie_right:hover { right: 6px; width: 30px !important; }

        #oo_tab.oo_tab_ie67_right.wcag { overflow: hidden !important; right: 0px !important; width: 26px !important; }
        #oo_tab.oo_tab_ie67_right.wcag:hover { right: 0px !important; width: 31px !important; }
        #oo_tab.oo_tab_ie67_right.wcag a { background: none; z-index: 1; }
        #oo_tab.oo_tab_ie67_right.wcag .screen_reader { bottom: 15px; display: block; background: url(/common/js/online_opinion_v5/images/oo_tab_icon.gif) no-repeat; height: 9px; width: 9px; position: absolute; left: 7px; top: auto; z-index: 9999; }
    
    

#oo_container { position: fixed; height: 100%; width: 100%; top: 0; left: 0; z-index: 999999; }

html body #oo_invitation_prompt { background: white; box-shadow: rgba(0, 0, 0, 0.6) 0 0 15px; -webkit-box-shadow: rgba(0, 0, 0, 0.6) 0 0 15px; -moz-box-shadow: rgba(0, 0, 0, 0.6) 0 0 15px; -webkit-box-shadow: rgba(0, 0, 0, 0.6) 0 0 8px; -moz-box-shadow: rgba(0, 0, 0, 0.6) 0 0 8px; border-radius: 9px; -moz-border-radius: 9px; -webkit-border-radius: 9px; color: #252525; font: 14px/20px Tahoma, Arial, san-serif; line-height: 20px; margin: 50px auto; text-align: left; padding: 20px 10px; position: relative; width: 350px; z-index: 999999; }
html body #oo_invitation_prompt h1 { font-size: 24px; font-weight: 100; margin-bottom: .6em; }
html body #oo_invitation_prompt p { margin-bottom: 1.5em; }
html body #oo_invitation_prompt #prompt_buttons { padding-bottom: 15px; position: relative; z-index: 5; }
html body #oo_invitation_prompt #oo_launch_prompt { text-decoration: none; color: white; border: 1px solid #006633; padding: 5px 11px; margin-right: 17px; }
html body #oo_invitation_prompt #oo_no_thanks { text-decoration: none; color: #252525; border: 1px solid #cccccc; padding: 5px 11px; margin-right: 18px; }
html body #oo_ol_brand { display: block; height: 22px; }

#oo_ol_brand { background: url(/common/js/online_opinion_v5/images/oo_inv_opinionlab.png) bottom right no-repeat; border-top: 1px solid #cccccc; }

#oo_invitation_prompt a { background: white; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; transition: background 0.5s; -moz-transition: background 0.5s; -webkit-transition: background 0.5s; -o-transition: background 0.5s; }
#oo_invitation_prompt a:hover { background: #eeeeee; }

a#oo_launch_prompt { background: #006633; }
a#oo_launch_prompt:hover { background: #009966; }

#oo_close_prompt { position: absolute; display: block; background: white; height: 20px; width: 20px; border: 1px solid #cccccc; cursor: pointer; right: 5px; top: 5px; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; transition: background 0.5s; -moz-transition: background 0.5s; -webkit-transition: background 0.5s; -o-transition: background 0.5s; font: 14px/20px Tahoma, Arial, Helvetica, sans-serif; text-align: center; }
#oo_close_prompt:hover { background: #eeeeee; }
#oo_close_prompt .screen_reader { color: transparent; display: block; position: relative; height: 0; width: 0; line-height: 0; overflow: hidden; }

/* Smartphones (portrait) ----------- */
@media only screen and (max-device-width: 480px) { /* Styles */
html body #oo_invitation_prompt { -webkit-text-size-adjust: none; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box; width: 90%; padding: 3%; } }
@media all and (-webkit-min-device-pixel-ratio: 2) { #oo_ol_brand { background: url(/common/js/online_opinion_v5/images/oo_inv_opinionlab@2x.png) bottom right no-repeat; -webkit-background-size: 85px 13px; } }
#oo_overlay, #oo_invitation_overlay { background: black url(/common/js/online_opinion_v5/images/oo_loading.gif) 50% 80px no-repeat; display: block; height: 1000%; left: 0; position: fixed; top: 0; width: 100%; z-index: 999998; opacity: 0.5; filter: alpha(opacity=50); }
#oo_overlay.no_loading, #oo_invitation_overlay.no_loading { background: black; opacity: 0.5; filter: alpha(opacity=50); }

@media print { #oo_bar, .oo_feedback_float, #oo_tab { display: none; } }