class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.341.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.341.1/snyk-macos"
    sha256 "3467f0b11017ebecaf630949907ad59edae468c2cfd6bd4b4831aaca713fcca8"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.341.1/snyk-linux"
    sha256 "a83f5d2db5cdd981f7164520485d89dded6201c4bca534622fa4117a184837ba"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
