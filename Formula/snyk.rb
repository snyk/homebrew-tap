class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.514.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.514.0/snyk-macos"
    sha256 "af05fa5d81804a8c22082e74630e78aa10ea5542de7f354fc64c9f9458e3d79f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.514.0/snyk-linux"
    sha256 "1211fe41807465729c9ba4dcf71300a41288fd0e92b1c36b8770f399bb72b3fe"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
