/*
 * Copyright (c) 2022, Andreas Kling <kling@serenityos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <LibWeb/Bindings/SVGClipPathElementPrototype.h>
#include <LibWeb/HTML/Window.h>
#include <LibWeb/SVG/SVGClipPathElement.h>

namespace Web::SVG {

SVGClipPathElement::SVGClipPathElement(DOM::Document& document, DOM::QualifiedName qualified_name)
    : SVGElement(document, move(qualified_name))
{
    set_prototype(&window().ensure_web_prototype<Bindings::SVGClipPathElementPrototype>("SVGClipPathElement"));
}

SVGClipPathElement::~SVGClipPathElement()
{
}

RefPtr<Layout::Node> SVGClipPathElement::create_layout_node(NonnullRefPtr<CSS::StyleProperties>)
{
    return nullptr;
}

}
