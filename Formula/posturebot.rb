class Posturebot < Formula
  desc "Tiny 8-bit terminal bot that reminds you to check your posture"
  homepage "https://github.com/m3gm3g/PostureBot"
  url "https://github.com/m3gm3g/PostureBot/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "56611349f90737815ac14491df219293d5cea2f548f82eaa3f862727a6e5e2a9"
  license "MIT"

  depends_on "python@3.14"

  def install
    libexec.install "posture_bot.py"
    (bin/"posturebot").write <<~EOS
      #!/bin/bash
      exec "#{formula_opt_bin("python@3.14")}/python3.14" "#{libexec}/posture_bot.py" "$@"
    EOS
    chmod 0755, bin/"posturebot"
  end

  test do
    assert_match "--minutes", shell_output("#{bin}/posturebot --help")
  end
end
