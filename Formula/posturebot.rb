class Posturebot < Formula
  desc "Tiny 8-bit terminal bot that reminds you to check your posture"
  homepage "https://github.com/m3gm3g/PostureBot"
  url "https://github.com/m3gm3g/PostureBot/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "b6aa01a8429d0bc8fedb8b68c15deb955b12f99b71415c0d1fd41bff1bb85549"
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
    assert_match "usage: posturebot", shell_output("#{bin}/posturebot --help")
  end
end
