class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.745.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.745.0/snyk-macos"
    sha256 "9854ff9c6f4bdb12a0b1576b392379a32fea92a06116e930b2b04dbd471fd0d9"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.745.0/snyk-linux"
    sha256 "f022e7f4ea7020d3b7c184a1c2ba239df5c0f5ec521c439bd797371802126d00"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
