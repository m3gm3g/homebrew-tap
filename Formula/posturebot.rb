class Posturebot < Formula
  desc "Tiny 8-bit terminal bot that reminds you to check your posture"
  homepage "https://github.com/m3gm3g/PostureBot"
  url "https://github.com/m3gm3g/PostureBot/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "85d89ad18f8a27d14a5fd0ff674983571db5af8e3169291a84c4d5dcfaf1a116"
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
