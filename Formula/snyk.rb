class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1032.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1032.0/snyk-macos"
    sha256 "9b1f9d0b2bbba47bbfb11d81fe982d2c71da359cb13ddcc1e3f7e008e8d15dbc"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1032.0/snyk-linux"
    sha256 "106f3ab1df854254a49f1e1f56ef3d9d17b03e959ceac6246f0f76656a6e619b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
