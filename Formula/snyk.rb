class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.993.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.993.0/snyk-macos"
    sha256 "1802464535900ef1b2cb3c6fca891a86edef33c2a1d2d53f134455723d394967"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.993.0/snyk-linux"
    sha256 "803757b40cef5ab22334d0c72e43013e10bc816071f8304b528ef8b0fa6c9d02"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
