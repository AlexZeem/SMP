#include <QMediaPlayer>
#include <QAudioProbe>

#include "Player.h"
#include<QDebug>

namespace audio {

struct Player::impl_t
{
    impl_t(Player& obj)
        : _this(obj)
        , player(new QMediaPlayer(&obj))
        , probe(new QAudioProbe)
    {
        QObject::connect(probe, SIGNAL(audioBufferProbed(QAudioBuffer))
                       , &_this, SLOT(processBuffer(QAudioBuffer)));
        qDebug() << probe->setSource(player); // Returns true, hopefully.

        byte << "green" << "green" << "green";
    }

    Player& _this;
    QMediaPlayer *player;
    QAudioProbe *probe;
    QVariantList byte;
};


Player::Player(QObject *parent)
    : QObject(parent)
    , impl(new impl_t(*this))
{ }

Player::~Player()
{ }

QVariantList Player::byte() const
{
    return impl->byte;
}

void Player::doSomething(QString file)
{
    //if (file.isEmpty()) return;
    qDebug() << "doSomething" << file;
    impl->player->setMedia(QUrl::fromLocalFile("D:/Kalimba.mp3"));
    impl->player->setVolume(50);
    impl->player->play();
}

void Player::processBuffer(QAudioBuffer buffer)
{
    const quint8 *data = buffer.constData<quint8>();
    quint8 value = *data;

    qDebug() << "processBuffer" << value;


    impl->byte.clear();
    emit byteChanged();
}

} // namespace audio


