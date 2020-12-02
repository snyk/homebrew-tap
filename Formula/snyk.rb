class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.433.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.433.0/snyk-macos"
    sha256 "a8d4f5a29caa68f03248a0ee1b28449a73add140f49e1b0046b022ba6830b758"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.433.0/snyk-linux"
    sha256 "c42d24d8cecb90ea6ee4ecd7eaba474983ac107cc6e2d57897a71503f102fad2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
