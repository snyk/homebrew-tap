class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1080.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1080.0/snyk-macos"
    sha256 "44afb1ea5027ac27a5d9660d1188efc67689dfa05bc7d9d8c3a1111101be9ed2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1080.0/snyk-linux"
    sha256 "270d785dab697adbb047e2d9f0563892aad4f969163c8ee3c716c07c76b8d6d5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
