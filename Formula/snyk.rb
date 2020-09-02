class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.387.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.387.1/snyk-macos"
    sha256 "b5077cad4d60227598bfca7ced4ca020c48f3294c650ac759d0e61d43c5dee59"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.387.1/snyk-linux"
    sha256 "323c44057ac27ca731cda9f62f2ba0040a23057e60259bd22df0dbeaca049b87"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
