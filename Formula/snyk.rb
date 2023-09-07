class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1213.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1213.0/snyk-macos"
    sha256 "ae2baf45311e9b93b2fb9bc6112aad6b682fc52c45a257fd66476e5b2660b46a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1213.0/snyk-linux"
    sha256 "049560b3f03699b50e31ac77e81f6b507cb2a46582623786d8c37957f1fa8014"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
