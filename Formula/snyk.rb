class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.701.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.701.0/snyk-macos"
    sha256 "74596f7c54fb76be3b56c77656fce33ced1af5aad5c7f144e0b2ef9d34b8e626"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.701.0/snyk-linux"
    sha256 "ab1dc76e448757d8aeff49fecdc5b535ed89b89549d73697e7866c996d8cd856"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
