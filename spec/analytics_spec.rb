require 'spec_helper'

describe Split::Analytics do
  include Split::Helper
  it "should generate valid analytics javascript" do
    tracking_code = tracking_code(:account => 'UA-12345-6')
    tracking_code.should eql("        <script type=\"text/javascript\">\n          var _gaq = _gaq || [];\n          _gaq.push(['_setAccount', 'UA-12345-6']);\n          \n          _gaq.push(['_trackPageview']);\n\n          (function() {\n            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;\n            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';\n            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);\n          })();\n        </script>\n")
  end

  it "should add custom variables for every test the user is involved in" do
    first_alt = ab_test('link_colour', 'red', 'blue')
    second_alt = ab_test('link_text', 'Join', 'Signup')

    session[:split].should eql({'link_colour' => first_alt,'link_text' => second_alt})

    tracking_code = tracking_code(:account => 'UA-12345-6')
    tracking_code.should eql("        <script type=\"text/javascript\">\n          var _gaq = _gaq || [];\n          _gaq.push(['_setAccount', 'UA-12345-6']);\n          _gaq.push(['_setCustomVar', 1, 'link_colour', '#{first_alt}', 1]);\n_gaq.push(['_setCustomVar', 2, 'link_text', '#{second_alt}', 1]);\n          _gaq.push(['_trackPageview']);\n\n          (function() {\n            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;\n            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';\n            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);\n          })();\n        </script>\n")
  end
end