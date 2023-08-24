class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1206.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1206.0/snyk-macos"
    sha256 "02dd8ed63b9e0c1072a23999c345e78c1d0b32a122fd8f11e78734661843e5eb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1206.0/snyk-linux"
    sha256 "01972a9466310421e944c883bd1c0783ac0aa666113482512e7ef529c0ff1119"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
