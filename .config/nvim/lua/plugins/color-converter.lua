return {
  "NTBBloodbath/color-converter.nvim",
  opts = {
    -- For more information visit config
    -- https://github.com/NTBBloodbath/color-converter.nvim?tab=readme-ov-file#configuration
    hsl_pattern = "hsl([h] [s]% [l]%)",
    hsla_pattern = "hsl([h] [s]% [l]% / [a])",
    rgba_pattern = "rgb([r] [g] [b] / [a])",
  },
  keys = {

    {
      ",cc",
      function()
        require("color-converter").cycle()
      end,
      desc = "Cycle color formats",
    },
  },
}
-- require('color-converter').cycle()
-- Cycle between HEX, RGB and HSL.
-- require('color-converter').to_hex()
-- Convert the current color to HEX.
-- require('color-converter').to_rgb()
-- Convert the current color to RGB.
-- require('color-converter').to_hsl()
-- Convert the current color to HSL.
-- require('color-converter').pick()
-- Pick between all of the available formats.
