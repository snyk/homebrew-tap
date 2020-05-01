class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.316.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.316.1/snyk-macos"
    sha256 "bac5070963e6f0b4e0b7f0da8fb9fb8414bbbbb68812f16e8ca0d7734c485984"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.316.1/snyk-linux"
    sha256 "a884f284b12985a8e0e3608257faa5c29132e8097dce56554f1631cca1422ca9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
