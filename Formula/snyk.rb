class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.950.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.950.0/snyk-macos"
    sha256 "31cd09b532b8dc63c8cc5c54fd70fa447942682d597b1bb151ae630f436731ec"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.950.0/snyk-linux"
    sha256 "6cfb35982c58b480f0ab34085127d9d81b3a13bfa165777c303eb2e171ffebef"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
