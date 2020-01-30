class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.288.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.288.0/snyk-macos"
    sha256 "2e4b646100ab7857e8963c49b012ee6473978c7e1f783a799e09220a0b859a00"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.288.0/snyk-linux"
    sha256 "8eb62437e50fb1165918e45b2e5dd78152321182933195aebeb65ef1b6e0f894"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
