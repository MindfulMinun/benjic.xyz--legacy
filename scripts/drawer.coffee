---
---
'use strict'
sideNavBtns = document.querySelectorAll '[data-action="open-side-nav"]'

[].forEach.call(sideNavBtns, (el) ->
    el.addEventListener('click', ->
        xyz.drawer.open(this)
    )
)

xyz["drawer"] =
    container: document.querySelector '.side-nav'
    returnFocusTo: null
    open: (element) ->
        ###
         * Purpose: To open the nav drawer
         * Accepts: An HTMLElement, the element to return focus to once the drawer is closed
         * Returns: Nothing, this is a void function
        ###
        this.container.setAttribute "data-drawer-state", "open"
        this.container.removeAttribute "aria-hidden"

        if not element
            xyz.warn("a11y: Focus was brought into the nav drawer without an element to return focus to. Focus will be blurred upon closing. This isn’t good for screen-reader users or users who navigate via keyboard.")


        this.returnFocusTo = element
        # Stop HTML from scrolling & keep focus
        document.documentElement.style.overflow = "hidden"
        this.container.removeAttribute('aria-hidden')

        # Lastly, place focus in nav
        this.container.querySelector('a, button').focus()

    close: (element) ->
        ###
         * Purpose: To close the nav drawer
         * Accepts: An HTMLElement, the element to return focus to once the drawer is closed (overrides element set by .open)
        ###
        this.container.removeAttribute("data-drawer-state")

        if element
            this.returnFocusTo = element

        if this.returnFocusTo
            this.returnFocusTo.focus()
        else
            #! If there's no element to focus to, throw a warning
            xyz.warn("a11y: There wasn’t an element to return focus to, so focus was blurred. This isn’t good for screen-reader users or users who navigate via keyboard.")
            document.documentElement.querySelector('a, button').focus();
            document.documentElement.querySelector('a, button').blur();

        # Allow body to scroll again
        document.documentElement.style.overflow = "";
        this.container.setAttribute("aria-hidden", true);
