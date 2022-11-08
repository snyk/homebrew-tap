class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1054.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1054.0/snyk-macos"
    sha256 "2e1790a703cb7de603667ebb4c0f292eaef753822109ac82ae019fc9050cf53d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1054.0/snyk-linux"
    sha256 "a1b35e178294383b476adc884995b0158438b8240b84d336e88146b06944e913"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
