class Posturebot < Formula
  desc "Tiny 8-bit terminal bot that reminds you to check your posture"
  homepage "https://github.com/m3gm3g/PostureBot"
  url "https://github.com/m3gm3g/PostureBot/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "56611349f90737815ac14491df219293d5cea2f548f82eaa3f862727a6e5e2a9"
  license "MIT"

  depends_on "python@3.14"

  def install
    bin.install "posture_bot.py" => "posturebot"
    rewrite_shebang Language::Python.rewrite_python_shebang(Formula["python@3.14"].opt_bin/"python3.14"),
                    bin/"posturebot"
  end

  test do
    assert_match "usage: posturebot", shell_output("#{bin}/posturebot --help")
  end
end
