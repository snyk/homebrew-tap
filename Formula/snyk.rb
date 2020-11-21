class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.430.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.430.0/snyk-macos"
    sha256 "7579625f50692a96aa6b0696cac92ead0b55ce915b230741ef864ca953c1c1df"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.430.0/snyk-linux"
    sha256 "882a81d053d81695567e014007622e336d44f397ba21b078cd8f11b84c44a769"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
