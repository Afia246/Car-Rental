using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Public
{
    public partial class Public : MasterPage
    {
        // ---- Theme knobs ----
        public string SiteBackground = "#E3E5DA";
        public string BodyTextColor = "#0E1F17";
        public string LinkColor = "#0E8F69";
        public string LinkHoverColor = "#0b6f53";

        public int LogoHeightDesktopPx = 180;
        public int LogoHeightMobilePx = 100;

        public double NavbarPadYRem = 0.15;
        public double NavLinkPadYRem = 0.45;
        public double NavLinkPadXRem = 0.70;

        public string LogoUrl = "~/Assets/Img/Greenmile.png";

        // Helper getters (avoid designer dependency)
        private Image BrandLogoCtl => FindControl("BrandLogo") as Image;
        private Literal DynamicCssCtl => FindControl("DynamicCss") as Literal;

        protected void Page_Load(object sender, EventArgs e)
        {
            var logo = BrandLogoCtl;
            if (logo != null)
            {
                if (string.IsNullOrEmpty(logo.ImageUrl))
                    logo.ImageUrl = ResolveUrl(LogoUrl);

                logo.AlternateText = "GreenMile Garage";
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            // estimate header height (logo + vertical padding + 1px border)
            int headerHDesktopPx = LogoHeightDesktopPx + (int)Math.Round(NavbarPadYRem * 2 * 16) + 1;
            int headerHMobilePx = LogoHeightMobilePx + (int)Math.Round(NavbarPadYRem * 2 * 16) + 1;

            var css = new StringBuilder();
            css.AppendLine("<style>");
            css.AppendLine("/* Dynamic theme from Public.Master.cs */");
            css.AppendLine($@"
:root {{
  --logo-h-mobile:    {LogoHeightMobilePx}px;
  --logo-h-desktop:   {LogoHeightDesktopPx}px;
  --header-h-mobile:  {headerHMobilePx}px;
  --header-h-desktop: {headerHDesktopPx}px;

  --navbar-py: {NavbarPadYRem}rem;
  --nav-link-py: {NavLinkPadYRem}rem;
  --nav-link-px: {NavLinkPadXRem}rem;

  --ink: {BodyTextColor};
  --link: {LinkColor};
  --link-hover: {LinkHoverColor};
}}

html, body {{
  background-color: {SiteBackground} !important;
  color: var(--ink);
  font-family: 'Inter', system-ui, -apple-system, Segoe UI, Roboto, 'Helvetica Neue', Arial, sans-serif;
}}

/* in-page anchors land below sticky header */
html {{ scroll-padding-top: var(--header-h-desktop); }}
@media (max-width: 991.98px) {{
  html {{ scroll-padding-top: var(--header-h-mobile); }}
}}

/* Navbar */
.cly-navbar {{
  padding: var(--navbar-py) 0;
  background-color: {SiteBackground} !important;
  z-index: 1030;
}}
.cly-navbar.border-bottom {{ border-bottom-color: #cfcfcf !important; }}

/* Nav link color + hover (header requirement) */
.cly-navbar .nav-link {{
  color:#233836 !important;
  font-weight:600;
}}
.cly-navbar .nav-link:hover,
.cly-navbar .nav-link:focus {{
  color:#0E8F69 !important;
}}

/* Logo */
.brand-logo {{
  height: var(--logo-h-desktop);
  width: auto;
  display: block;
}}
@media (max-width: 991.98px) {{
  .brand-logo {{ height: var(--logo-h-mobile); }}
}}

/* Spacer so sticky header doesn't overlap content */
.main-wrap {{ padding-top: var(--header-h-desktop); }}
@media (max-width: 991.98px) {{
  .main-wrap {{ padding-top: var(--header-h-mobile); }}
}}
");
            css.AppendLine("</style>");

            var dyn = DynamicCssCtl;
            if (dyn != null)
                dyn.Text = css.ToString();
        }

        // Optional per-page overrides
        public void SetTheme(
            string siteBackground = null,
            string bodyText = null,
            string link = null,
            string linkHover = null,
            int? logoDesktopPx = null,
            int? logoMobilePx = null,
            double? navbarPyRem = null,
            double? navLinkPyRem = null,
            double? navLinkPxRem = null,
            string logoUrl = null)
        {
            if (!string.IsNullOrWhiteSpace(siteBackground)) SiteBackground = siteBackground;
            if (!string.IsNullOrWhiteSpace(bodyText)) BodyTextColor = bodyText;
            if (!string.IsNullOrWhiteSpace(link)) LinkColor = link;
            if (!string.IsNullOrWhiteSpace(linkHover)) LinkHoverColor = linkHover;

            if (logoDesktopPx.HasValue) LogoHeightDesktopPx = logoDesktopPx.Value;
            if (logoMobilePx.HasValue) LogoHeightMobilePx = logoMobilePx.Value;

            if (navbarPyRem.HasValue) NavbarPadYRem = navbarPyRem.Value;
            if (navLinkPyRem.HasValue) NavLinkPadYRem = navLinkPyRem.Value;
            if (navLinkPxRem.HasValue) NavLinkPadXRem = navLinkPxRem.Value;

            if (!string.IsNullOrWhiteSpace(logoUrl))
            {
                LogoUrl = logoUrl;
                var logo = BrandLogoCtl;
                if (logo != null) logo.ImageUrl = ResolveUrl(LogoUrl);
            }
        }
    }
}
