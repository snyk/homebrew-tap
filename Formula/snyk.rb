class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.526.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.526.0/snyk-macos"
    sha256 "fb9c5532c18c36f77e22475dcfab0ea3b25cc00f4f235438674a7fddf131cbf1"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.526.0/snyk-linux"
    sha256 "faabc2c8d6e7fe30396a5ab52435a397b8a646db00c2c19df8b30ac6845a1c00"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
