local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("vue", {
    s("vue", {
        t("<template>\n"),
        i(1),
        t("</template>\n"),
        t("\n"),
        t("<script setup>\n"),
        t("import { ref } from 'vue';\n"),
        t("\n"),
        t("</script>\n"),
        t("\n"),
        t("<style scoped>\n"),
        t("</style>\n"),
    }),
})
